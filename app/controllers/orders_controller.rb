class OrdersController < ApplicationController

  def create
    @goody = Goody.find(params[:goody_id])
  end

  def index
    @goody = Goody.find(params[:goody_id])
    @order = Order.new goody: @goody,
      goody: @goody,
      amount: @goody.price,
      payment_type: "stripe",
      paid: false,
      quantity: 1
  end

end
