Rails.application.routes.draw do

  resources :user_applications
  resources :company_applications
  get 'sessions/new'

  get 'home/index'

  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :companies do
    resources :applications, :controller => 'company_applications'
  end
  resources :users do
    resources :applications, :controller => 'user_applications'
  end



  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
