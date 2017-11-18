class AddOrderSuccessToCampaign < ActiveRecord::Migration[5.1]
  def change
    add_column :campaigns, :order_success, :text
    add_column :campaigns, :order_success_html, :text
  end
end
