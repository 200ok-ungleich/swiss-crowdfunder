class OrdersController < ApplicationController

  # TODO: Think about proper safety in this method/controller. This
  #       code is for demo purposes only and not for production use
  def create
    @goody = Goody.find(params[:goody_id])
    @order = Order.new(order_params)
    @order.goody = @goody
    @order.amount = @goody.price
    @order.payment_type = "stripe"
    @order.quantity = 1
    @order.paid = false

    if @order.save
      @order.update_attribute :paid, true
      render action: 'create'
    else
      render action: 'new'
    end
  end

  def new
    @goody = Goody.find(params[:goody_id])
    @order = Order.new goody: @goody
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    params.require(:order).permit(:agreement)
  end

end
