ActiveAdmin.register Goody do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :title, :description, :price, :quantity, :campaign_id

  form do |f|
    inputs do
      input :campaign, collection: Campaign.unscoped
      input :title
      input :description
      input :price
      input :quantity, label: "Quantity (-1 for infinite)"
    end
    actions
  end

end
