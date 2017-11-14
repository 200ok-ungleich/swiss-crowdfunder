class OrdersController < ApplicationController

  # TODO: Think about proper safety in this method/controller. This
  #       code is for demo purposes only and not for production use
  def create
    @goody = Goody.find(params[:goody_id])
    @order = Order.new(order_params)
    @order.goody = @goody
    @order.amount = @goody.price
    @order.payment_type = "bank"
    @order.quantity = 1
    @order.paid = false

    if NewOrderService.new(@order).call
      redirect_to [@goody.campaign, @goody, @order]
    else
      render action: 'new'
    end
  end

  def show
    @goody = Goody.find(params[:goody_id])
  end


  def new
    @goody = Goody.find(params[:goody_id])
    @order = Order.new goody: @goody
    @order.build_supporter
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    params.require(:order).permit(:agreement, supporter_attributes:
    [:first_name, :last_name, :email, :date_of_birth, :street,
    :postal_code, :country, :city, :state])
  end

end
