class User < ApplicationRecord
  has_many :snake_charms
  validates_presence_of :town
end
