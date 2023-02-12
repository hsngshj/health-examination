Rails.application.routes.draw do
  root to: 'toppages#index'
    
  get 'signup', to: 'users#new'
  resources :users, except: [:index, :new]

  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :health_examination_results
end