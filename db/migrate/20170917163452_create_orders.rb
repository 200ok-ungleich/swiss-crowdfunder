class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :quantity
      t.integer :amount
      t.string :payment_type
      t.boolean :paid
      t.references :goodie, foreign_key: true

      t.timestamps
    end
  end
end
