class RemoveImageFromGoodies < ActiveRecord::Migration[5.1]
  def change
    remove_column :goodies, :image
  end
end
