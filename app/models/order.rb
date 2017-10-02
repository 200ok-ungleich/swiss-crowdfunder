class Order < ApplicationRecord
  belongs_to :goody

  validates :payment_type, inclusion: { in: %w(stripe bank) }
  validates :agreement, presence: true
end
