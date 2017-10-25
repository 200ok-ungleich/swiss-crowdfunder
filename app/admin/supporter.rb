ActiveAdmin.register Supporter do

permit_params :order_id, :email, :first_name, :last_name,
  :date_of_birth, :email, :street, :postal_code, :country, :city, :state


  form do |f|
    inputs do
      input :order, member_label: :id
      input :email
      input :email
      input :first_name
      input :last_name
      input :email
      input :date_of_birth, as: :string
    end
    actions
  end

end
