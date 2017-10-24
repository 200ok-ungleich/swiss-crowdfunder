ActiveAdmin.register Supporter do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :order_id, :email, :first_name, :last_name, :date_of_birth, :email


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
#
# or
#
# permit_params do
#   permitted = [:permitted:attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
