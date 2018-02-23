Rails.application.routes.draw do

  get 'sessions/new'

  get 'home/index'

  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get    '/jobsearch', to: 'jobs#search'

  resources :companies do
    resources :jobs do
      resources :applications, :controller => 'job_applications'
    end
  end
  resources :users do
    resources :jobs, :controller => 'user_jobs' 
    resources :applications, :controller => 'user_applications'
  end



  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
