Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :campaigns, only: [:show] do
    resources :goodies, only: [:index]
  end

  root to: "root#index"
end
