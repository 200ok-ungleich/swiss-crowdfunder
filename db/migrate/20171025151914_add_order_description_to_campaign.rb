class AddOrderDescriptionToCampaign < ActiveRecord::Migration[5.1]
  def change
    add_column :campaigns, :order_description, :text
    add_column :campaigns, :order_description_html, :text
  end
end
