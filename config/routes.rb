# frozen_string_literal: true

Rails.application.routes.draw do

  resources :services
  root to: 'users#home'

  get '/cars_owners_documents/:user_id/new_document', to: 'cars_owners_documents#new_document', as: 'new_document'
  put '/cars_owners_documents/:user_id/add_document', to: 'cars_owners_documents#add_document', as: 'add_document'
  resources :cars_owners_documents
  
  resources :car_consumable_values

  resources :cars

  get '/cars/:id/parts', to: 'cars#parts', as: 'parts'
  get '/cars/:id/new_part', to: 'cars#new_part', as: 'new_part'
  put '/cars/:id/add_part', to: 'cars#add_part', as: 'add_part'

  get '/organizations/:id/services', to: 'organizations#services', as: 'organization_services'
  get '/organizations/:id/service', to: 'organizations#new_services', as: 'new_organization_services'
  get '/organizations/:id/service/works', to: 'organizations#service_works', as: 'organization_service_works'
  post '/organizations/:id/service', to: 'organizations#add_services', as: 'add_organization_services'
  resources :organizations

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  resources :users
end
