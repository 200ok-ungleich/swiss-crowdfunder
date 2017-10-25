Rails.application.routes.draw do

  get 'static/about-us', to: 'static#about_us'
  get 'static/terms-of-service', to: 'static#terms_of_service'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :campaigns, only: [:show] do
    resources :goodies, only: [:index] do
      resources :orders, only: [:new, :show, :create]
    end
  end

  get "*any", via: :all, to: "errors#not_found"

  if Campaign.first
    root to: redirect("/campaigns/#{Campaign.first.to_param}", status: 302)
  else
    root to: "root#index"
  end
end
