class Order < ApplicationRecord
  belongs_to :goodie

  validates :payment_type, inclusion: { in: %w(stripe bank) }
end
