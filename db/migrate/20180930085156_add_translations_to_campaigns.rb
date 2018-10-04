class AddTranslationsToCampaigns < ActiveRecord::Migration[5.1]
  def change
    reversible do |dir|
      dir.up do
        Campaign.create_translation_table! :title => :string,
                                           :description => :text,
                                           :description_html => :text,
                                           :claim => :text,
                                           :order_description => :text,
                                           :order_description_html => :text,
                                           :order_success => :text,
                                           :order_success_html => :text,
                                           :youtube_url => :string
      end

      dir.down do
        Campaign.drop_translation_table!
      end
    end
  end
end
