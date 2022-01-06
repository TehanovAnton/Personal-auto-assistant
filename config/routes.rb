# frozen_string_literal: true

Rails.application.routes.draw do
  resources :cars

  resources :organizations

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  resources :users
end
