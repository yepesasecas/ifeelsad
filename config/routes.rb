Rails.application.routes.draw do
  resources :feelings
  resources :countries
  get 'landing/index'

  root to: 'landing#index'
end
