# -*- coding: utf-8 -*-
class Goody < ApplicationRecord
  translates :title, :description

  # Add relation, but also allow non-active campaigns to already
  # create goodies
  belongs_to :campaign, -> { unscope(where: 'active') }
  has_many :orders
  has_many :supporters, through: :orders

  validates :price, numericality: true, presence: true
  validates :quantity, numericality: true, presence: true

  validates_presence_of :title, :description

  def orders_count
    orders.count
  end

  def remaining_quantity
    if quantity != -1
      quantity - orders_count
    else
      '∞'
    end
  end

end
