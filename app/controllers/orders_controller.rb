class OrdersController < ApplicationController

  def index
      @goodie = Goodie.find(params[:goodie_id])
      @order = Order.new goodie: @goodie,
        amount: @goodie.price,
        payment_type: "stripe",
        paid: false,
        quantity: 1
  end

end
