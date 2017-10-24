class AddFacebookAndTwitterToCampaigns < ActiveRecord::Migration[5.1]
  def change
    add_column :campaigns, :facebook_url, :string
    add_column :campaigns, :twitter_url, :string
  end
end
