class AddDescriptionHtmlToCampaign < ActiveRecord::Migration[5.1]
  def change
    add_column :campaigns, :description_html, :text
  end
end
