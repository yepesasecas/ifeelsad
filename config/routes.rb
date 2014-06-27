Rails.application.routes.draw do
  resources :feelings
  get 'landing/index'

  root to: 'landing#index'
end
