Rails.application.routes.draw do
  resources :additional_params
  resources :formulas
  resources :users
  root 'users#index'
end
