class AddAddressToSupporter < ActiveRecord::Migration[5.1]
  def change
    add_column :supporters, :street, :string
    add_column :supporters, :city, :string
    add_column :supporters, :state, :string
    add_column :supporters, :postal_code, :string
    add_column :supporters, :country, :string
  end
end
