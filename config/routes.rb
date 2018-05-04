# frozen_string_literal: true

Rails.application.routes.draw do
  root 'homepage#index'

  devise_for :users

  resources :feedbacks
  resources :transactions
  resources :users, only: %i[index show]
end
