# frozen_string_literal: true

Rails.application.routes.draw do
  get 'category/index'
  get 'category/:category' => 'category#show', as: 'category_single'
  patch 'borrow/:id' => 'transactions#borrow', as: 'borrow'
  #resources :category, only: %i[index show]
  root 'homepage#index'

  devise_for :users

  resources :feedbacks
  resources :transactions
  resources :users, only: %i[index show]
end
