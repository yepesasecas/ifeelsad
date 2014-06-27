Rails.application.routes.draw do
  get 'landing/index'

  root to: 'landing#index'
end
