# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GraphqlController, type: :controller do
  let(:user) { create(:user, role: :car_owner) }

  describe '#create' do
    include_examples 'mutation return response' do
      let(:mutation_resolver) { 'userCreate' }
      let(:description) { 'create user' }
      let(:input_variables) do
        {
          userInput: {
            userInput: {
              firstName: 'osavldo',
              lastName: 'lugones',
              email: 'lugones@gmail.com',
              phoneNumber: '12345',
              role: 0,
              password: 'ewqqwe'
            }
          }
        }
      end
      let(:mutation) do
        <<~GQL
          mutation UserCreate($userInput: UserCreateInput!) {
            userCreate(input: $userInput) {
                user {
                  id
                  firstName
                  lastName
                  email
                  phoneNumber
                  role
                }
            }
          }
        GQL
      end
    end
  end

  describe '#delete' do
    include_examples 'mutation return response' do
      let(:mutation_resolver) { 'userDelete' }
      let(:description) { 'delete user' }
      let(:mutation) do
        <<~GQL
          mutation UserDelete($userDeleteInput: UserDeleteInput!) {
            userDelete(input: $userDeleteInput) {
              user {
                  id
                  firstName
                  lastName
              }
            }
          }
        GQL
      end
      let(:input_variables) do
        {
          userDeleteInput: {
            id: user.id
          }
        }
      end
    end
  end

  describe '#update' do
    include_examples 'mutation return response' do
      let(:mutation_resolver) { 'userUpdate' }
      let(:description) { 'update user' }
      let(:mutation) do
        <<~GQL
          mutation UserUpdate($userInput: UserUpdateInput!) {
            userUpdate(input: $userInput) {
              user {
                id
                firstName
                lastName
                email
                phoneNumber
                role
              }
            }
          }
        GQL
      end
      let(:input_variables) do
        {
          userInput: {
            id: user.id,
            userInput: {
              firstName: 'Artas',
              lastName: 'Alharak'
            }
          }
        }
      end
    end
  end
end
