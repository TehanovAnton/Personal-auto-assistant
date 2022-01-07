# frozen_string_literal: true

Rails.application.routes.draw do
  resources :car_consumable_values
  root to: 'users#home'

  resources :cars

  resources :organizations

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  resources :users
end
