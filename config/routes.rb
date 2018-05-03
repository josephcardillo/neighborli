Rails.application.routes.draw do
  root :to => "homepage#index"
  devise_for :users
  resources :feedbacks
  resources :transactions
  resources :users, :only => [:index, :show] 
end

