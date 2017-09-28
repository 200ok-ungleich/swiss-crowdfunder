class AddAgreementToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :agreement, :boolean
  end
end
