Rails.application.routes.draw do

  resources :formulas

  resources :users do
    resources :formulas, only: [:edit, :new, :create]
  end

  
  get 'sessions/new'

  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  

  root 'users#index'
end
