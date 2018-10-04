ActiveAdmin.register Campaign do
#
  permit_params :goal, :start_date, :end_date, :title, :youtube_url,
    :description, :claim, :twitter_url, :facebook_url,
    :order_description, :order_success, :email, :image, :active

  # friendly_id resource lookup
  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end

    protected
    def scoped_collection
      super.unscoped
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
      input :title, label: 'Title (I18n)'
      input :active, label: 'Active (will otherwise only be visible through unique slug URL)'
      input :claim, label: 'Claim (I18n)'
      input :goal
      input :email
      input :image
      input :start_date
      input :end_date
      input :youtube_url, label: 'Youtube URL (I18n)'
      input :facebook_url
      input :twitter_url
      input :description, label: 'Description(I18n, Markdown)'
      input :order_description, label: 'Order Description(I18n, Markdown)'
      input :order_success, label: 'Order Success(I18n, Markdown)'
    end
    actions
  end

end
