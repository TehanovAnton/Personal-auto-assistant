# frozen_string_literal: true

Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  resources :comments

  resources :works
  root to: 'users#home'

  resources :orders

  resources :services

  post '/search', to: 'search#search'

  get '/cars_owners_documents/:user_id/new_document', to: 'cars_owners_documents#new_document', as: 'new_document'
  put '/cars_owners_documents/:user_id/add_document', to: 'cars_owners_documents#add_document', as: 'add_document'
  resources :cars_owners_documents
  
  resources :car_consumable_values

  get '/cars/:id/parts', to: 'cars#parts', as: 'parts'
  get '/cars/:id/new_part', to: 'cars#new_part', as: 'new_part'
  put '/cars/:id/add_part', to: 'cars#add_part', as: 'add_part'
  resources :cars

  get '/organizations/:id/services', to: 'organizations#services', as: 'organization_services'
  resources :organizations

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  resources :users
end
