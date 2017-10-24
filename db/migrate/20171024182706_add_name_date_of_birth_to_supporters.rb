class AddNameDateOfBirthToSupporters < ActiveRecord::Migration[5.1]
  def change
    add_column :supporters, :first_name, :string
    add_column :supporters, :last_name, :string
    add_column :supporters, :date_of_birth, :date
  end
end
