# frozen_string_literal: true

class SnakeCharm < ApplicationRecord
  has_many_attached :snake_photos
  belongs_to :user
  validates_format_of :caller_phone, with: /\A\d{10}+\Z/,
                                     message: 'Phone should match exact 10 digits'

  def self.caudals_processing(snake_charms_hash)
    snake_charms_hash.each do |caudal|
      next if caudal[:snake_caudals].nil?
      caudals_string = caudal[:snake_caudals]
      caudal[:snake_caudals] = {}
      caudal[:snake_caudals][:divided] =
        (caudals_string.split(';')[0]).split(':')[1]
      caudal[:snake_caudals][:undivided] =
        (caudals_string.split(';')[1]).split(':')[1]
    end
    snake_charms_hash
  rescue Exception::NoMethodError => e
    raise e
  end

  # TODO: this method is not DRY clean it up
  def self.caudal_processing(snake_charms_hash)
    binding.pry
    caudals_string = snake_charms_hash[:snake_caudals]
    snake_charms_hash[:snake_caudals] = {}
    snake_charms_hash['snake_caudals']['divided'] =
        (caudals_string.split(';')[0]).split(':')[1]
    snake_charms_hash['snake_caudals']['undivided'] =
        (caudals_string.split(';')[1]).split(':')[1]
    snake_charms_hash
  rescue Exception::NoMethodError => e
    raise e
  end

  def self.fetch_snake_charms
    snake_charms = SnakeCharm.all
    SnakeCharm.symbolize_object snake_charms
  end

  def self.fetch_snake_charm_user_id(user_id)
    snake_charm = SnakeCharm.where(user_id: user_id)
    symbolize_object snake_charm
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
