ActiveAdmin.register Campaign do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :goal, :start_date, :end_date, :title, :youtube_url,
  :description
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  form do |f|
    inputs do
      title
      goal
      start_date
      end_date
      youtube_url
      description
    end
  end

end
