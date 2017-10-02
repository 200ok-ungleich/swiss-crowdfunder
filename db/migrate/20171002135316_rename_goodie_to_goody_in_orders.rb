class RenameGoodieToGoodyInOrders < ActiveRecord::Migration[5.1]
  def change
    rename_column :orders, :goodie_id, :goody_id
  end
end
