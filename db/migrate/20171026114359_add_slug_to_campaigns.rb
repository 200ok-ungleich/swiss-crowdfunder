class AddSlugToCampaigns < ActiveRecord::Migration[5.1]
  def change
    add_column :campaigns, :slug, :string
    add_index :campaigns, :slug, unique: true
  end
end
