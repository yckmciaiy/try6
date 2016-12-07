Rails.application.routes.draw do

  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'

  resources :additional_params
  resources :formulas
  resources :users
  root 'users#index'
end
