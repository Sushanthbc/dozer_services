# frozen_string_literal: true

class SnakeCharm < ApplicationRecord
  has_many_attached :snake_photos
  belongs_to :user
  validates_format_of :caller_phone, with: /\A\d{1,13}+\Z/,
                                     message: 'Phone should match exact 10 digits'
  validates_presence_of :caller_name, :caller_phone, :address,
                        :village, :pincode, :snake_length,
                        :snake_length_unit

  def self.caudals_processing(snake_charms_hash)
    if snake_charms_hash.length.positive?
      snake_charms_hash.each do |caudal|
        unless caudal[:snake_caudals].nil?
          caudals_string = caudal[:snake_caudals]
          caudal[:snake_caudals] = {}
          caudal[:snake_caudals][:divided] =
            (caudals_string.split(';')[0]).split(':')[1]
          caudal[:snake_caudals][:undivided] =
            (caudals_string.split(';')[1]).split(':')[1]
        end
        user_info = User.find_by_id(caudal[:user_id])
        created_by =
          user_info.first_name.to_s + ' ' + user_info.last_name.to_s
        caudal[:created_by] = created_by
      end
    end
    snake_charms_hash
  rescue Exception::NoMethodError => e
    raise e
  end

  def self.fetch_snake_charms
    snake_charms = SnakeCharm.all.order(created_at: :desc)
    SnakeCharm.symbolize_object snake_charms
  end

  def self.fetch_snake_charm_user_id(user_id)
    snake_charm = SnakeCharm.where(user_id: user_id).order(created_at: :desc)
    symbolize_object snake_charm
  end

  def self.add_user_details(snake_charm_hash)
    User.where(id: snake_charm_hash[:user_id]).select('*')
  end

  def self.symbolize_object(snake_charms)
    if snake_charms.nil?
      snake_charms_symbolize = []
    else
      snake_charms_symbolize =
        snake_charms.map { |e| e.attributes.symbolize_keys }
    end
    snake_charms_symbolize
  end
end
