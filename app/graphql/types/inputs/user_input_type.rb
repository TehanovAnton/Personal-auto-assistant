# frozen_string_literal: true

module Types
  class Inputs::UserInputType < Types::BaseInputObject
    argument :id, ID, required: false
    argument :first_name, String, required: false
    argument :last_name, String, required: false
    argument :phone_number, String, required: false
    argument :email, String, required: false
    argument :role, Integer, required: false
    argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :password, String, required: true
    argument :encrypted_password, String, required: false
    argument :reset_password_token, String, required: false
    argument :reset_password_sent_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :remember_created_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :confirmation_token, String, required: false
    argument :confirmed_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :confirmation_sent_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :unconfirmed_email, String, required: false
    argument :provider, String, required: false
    argument :uid, String, required: false
  end
end
