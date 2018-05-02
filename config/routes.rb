Rails.application.routes.draw do
  resources :feedbacks
  resources :transactions
  devise_for :users

  devise_scope :user do
  
end

  root to: 'transactions#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
