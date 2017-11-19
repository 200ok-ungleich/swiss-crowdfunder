class AddImageToCampaigns < ActiveRecord::Migration[5.1]
  def change
    add_column :campaigns, :image, :string
  end
end
