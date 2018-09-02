class SnakeCharm < ApplicationRecord
  belongs_to :user
  validates_format_of :caller_phone, with: /\A\d{10}+\Z/,
                      message: 'Phone should macth exact 10 digits'
end
