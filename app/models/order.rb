class Order < ApplicationRecord
  belongs_to :goody

  has_one :supporter, dependent: :destroy
  accepts_nested_attributes_for :supporter

  validates :payment_type, inclusion: { in: %w(stripe bank) }
  validates :agreement, presence: true
  validates :supporter, presence: true

  validate :goody, :are_goodies_left?
  validate :goody, :is_campaign_active?

  def are_goodies_left?
    errors.add(:goody, "No goodies left!") if goody.remaining_quantity == 0
  end

  def is_campaign_active?
    errors.add(:goody, "Goody campaign is not active!") unless goody.campaign.is_active?
  end


end
