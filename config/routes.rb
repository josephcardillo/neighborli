# frozen_string_literal: true

Rails.application.routes.draw do
  root 'homepage#index'

  get 'category/index'
  get 'category/:category' => 'category#show', as: 'category_single'
  patch 'borrow/:id' => 'transactions#borrow', as: 'borrow'

  devise_for :users

  resources :feedbacks
  resources :transactions
  resources :users, only: %i[index show]
end
