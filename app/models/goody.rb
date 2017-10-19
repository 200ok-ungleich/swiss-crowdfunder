class Goody < ApplicationRecord
  belongs_to :campaign
  has_many :orders

end
