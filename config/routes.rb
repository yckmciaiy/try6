Rails.application.routes.draw do

  resources :extra_params, except: [:show, :index]
  resources :formulas do
    resources :extra_params, except: [:show, :index]
  end
 
  resources :users do
    resources :formulas do
      resources :extra_params, except: [:show, :index]
    end
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
