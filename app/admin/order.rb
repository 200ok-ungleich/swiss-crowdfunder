ActiveAdmin.register Order do
#
permit_params :quantity, :amount, :payment_type, :paid, :goody_id

index do
  selectable_column
  column :amount
  column :quantity
  column :payment_type
  column :paid
  column :goody
  column :supporter
  column :agreement
  column :created_at
  column :updated_at
  actions
end

show do
  attributes_table do
    row :quantity
    row :amount
    row :payment_type
    row :paid
    row :goody
    row :supporter
    row :agreement
    row :created_at
    row :updated_at
  end
  active_admin_comments
end

controller do
  def action_methods
    super - ['new', 'create']
  end
end

end
