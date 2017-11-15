ActiveAdmin.register Campaign do
#
  permit_params :goal, :start_date, :end_date, :title, :youtube_url,
    :description, :claim, :twitter_url, :facebook_url, :order_description, :email

  # friendly_id resource lookup
  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  index do
    selectable_column
    column :title
    column :start_date
    column :end_date
    column :claim
    column :created_at
    column :updated_at
    actions
  end
#

  form do |f|
    inputs do
      input :title
      input :claim
      input :goal
      input :email
      input :start_date
      input :end_date
      input :youtube_url
      input :facebook_url
      input :twitter_url
      input :description, label: "Description(Markdown)"
      input :order_description, label: "Order Description(Markdown)"
    end
    actions
  end

end
