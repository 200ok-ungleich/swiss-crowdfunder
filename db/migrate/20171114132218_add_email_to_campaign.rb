class AddEmailToCampaign < ActiveRecord::Migration[5.1]
  def change
    add_column :campaigns, :email, :string
  end
end
