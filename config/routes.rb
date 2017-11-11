Rails.application.routes.draw do

  get 'static/about-us', to: 'static#about_us'
  get 'static/terms-of-service', to: 'static#terms_of_service'
  get 'static/countdown', to: 'static#countdown'
  get 'static/exception_test', to: 'static#exception_test'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :campaigns, only: [:show] do
    resources :goodies, only: [:index] do
      resources :orders, only: [:new, :show, :create]
    end
  end

  get '*any', via: :all, to: 'errors#not_found'

  # root to: "root#index"
  if DateTime.now > DateTime.strptime('2017-11-11 20:00:00 +0100', '%Y-%m-%d %H:%M:%S %z')
    root to: redirect('/campaigns/ungleich-glarus-ag')
  else
    root to: redirect('/static/countdown')
  end
end
