class CreateGoodies < ActiveRecord::Migration[5.1]
  def change
    create_table :goodies do |t|
      t.string :title
      t.text :description
      t.string :image
      t.integer :price
      t.integer :quantity
      t.references :campaign, foreign_key: true

      t.timestamps
    end
  end
end
