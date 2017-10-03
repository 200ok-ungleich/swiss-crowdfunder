class Order < ApplicationRecord
  belongs_to :goody

  validates :payment_type, inclusion: { in: %w(stripe bank) }
  validates :agreement, presence: true

  # Stub methods
  # TODO: Do not go this path in production, this is only to easily
  #       create a form for the initial Demo
  def credit_card
  end
  def cvv
  end
  def ablaufdatum
  end

end
