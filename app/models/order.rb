class Order < ApplicationRecord
  belongs_to :goody

  has_one :supporter, dependent: :destroy
  accepts_nested_attributes_for :supporter

  validates :payment_type, inclusion: { in: %w(stripe bank) }
  validates :agreement, presence: true
  validates :supporter, presence: true

  #after_create :create_supporter

  #private

  #def create_supporter
  #  Supporter.create order_id: self.id
  #end

end
