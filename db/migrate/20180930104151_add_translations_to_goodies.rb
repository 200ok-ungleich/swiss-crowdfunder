class AddTranslationsToGoodies < ActiveRecord::Migration[5.1]
  def change
    reversible do |dir|
      dir.up do
        Goody.create_translation_table! :title => :string,
                                        :description => :text
      end

      dir.down do
        Goody.drop_translation_table!
      end
    end
  end
end
