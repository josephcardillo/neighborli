Rails.application.routes.draw do
  root to: 'transactions#index'

  resources :users, :only => [:index, :show] 
  resources :feedbacks
  resources :transactions
end