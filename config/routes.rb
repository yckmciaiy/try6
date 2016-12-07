Rails.application.routes.draw do
  get 'static_pages/about'

  get 'static_pages/contact'

  resources :additional_params
  resources :formulas
  resources :users
  root 'users#index'
end
