Rails.application.routes.draw do

  get 'home/index'

  resources :companies do
    resources :jobs
  end
  resources :users
  resources :applications

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
