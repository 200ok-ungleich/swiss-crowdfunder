class CreateCampaigns < ActiveRecord::Migration[5.1]
  def change
    create_table :campaigns do |t|
      t.integer :goal
      t.datetime :start
      t.datetime :end
      t.string :title
      t.string :youtube_url

      t.timestamps
    end
  end
end
