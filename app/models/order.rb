class Order < ApplicationRecord
  belongs_to :goody

  validates :payment_type, inclusion: { in: %w(stripe bank) }
  validates :agreement, presence: true

  after_create :create_supporter

  private

  def create_supporter
    Supporter.create order_id: self.id
  end

end
