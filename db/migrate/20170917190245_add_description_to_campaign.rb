class AddDescriptionToCampaign < ActiveRecord::Migration[5.1]
  def change
    add_column :campaigns, :description, :text
  end
end
