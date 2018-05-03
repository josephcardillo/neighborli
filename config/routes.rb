Rails.application.routes.draw do
  resources :feedbacks
  resources :transactions
  devise_for :users
  resources :users, :only => [:index, :show] 
  root :to => "homepage#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
