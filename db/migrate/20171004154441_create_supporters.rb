class CreateSupporters < ActiveRecord::Migration[5.1]
  def change
    create_table :supporters do |t|
      t.references :order, foreign_key: true
      t.string :email

      t.timestamps
    end
  end
end
