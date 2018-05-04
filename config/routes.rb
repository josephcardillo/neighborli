# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :feedbacks
  resources :transactions
  resources :users, only: %i[index show]

  authenticated :user do
    root 'homepage#dashboard', as: :authenticated_root
  end

  root 'homepage#index'
end
