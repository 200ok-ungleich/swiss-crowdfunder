class AddClaimToCampaign < ActiveRecord::Migration[5.1]
  def change
    add_column :campaigns, :claim, :text
  end
end
