Rails.application.routes.draw do
    root to: 'toppages#index'
    
    resources :users
    resources :health_examination_results
end
