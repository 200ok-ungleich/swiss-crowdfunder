require 'mattermost'

class NewOrderService

  def initialize(order)
    @order = order
  end

  def call
    if order_create
      # send_welcome_mail
      notify_mattermost
    end
  end

  private

  def order_create
    @order.save
  end

  def notify_mattermost
    Mattermost.send "A new subscriber has pledged #{@order.amount}CHF for campaign \"#{campaign_title(@order)}\""
  end

  def campaign_title(order)
    order.goody.campaign.title
  end
end
