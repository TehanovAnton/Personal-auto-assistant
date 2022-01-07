# frozen_string_literal: true

Rails.application.routes.draw do

  root to: 'users#home'

  get '/cars_owners_documents/:user_id/new_document', to: 'cars_owners_documents#new_document', as: 'new_document'
  put '/cars_owners_documents/:user_id/add_document', to: 'cars_owners_documents#add_document', as: 'add_document'
  resources :cars_owners_documents
  
  resources :car_consumable_values

  resources :cars

  get '/cars/:id/parts', to: 'cars#parts', as: 'parts'
  get '/cars/:id/new_part', to: 'cars#new_part', as: 'new_part'
  put '/cars/:id/add_part', to: 'cars#add_part', as: 'add_part'
  resources :organizations

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  resources :users
end
