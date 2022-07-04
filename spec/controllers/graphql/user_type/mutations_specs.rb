# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GraphqlController, type: :controller do
  let(:user) { create(:user, role: :car_owner) }

  describe '#create' do
    let(:userInput) do
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

    it 'create user' do
      result = PersonalAutoAssitatntSchema.execute(mutation, variables: userInput)
      expect(result['data']['userCreate']).not_to be_empty
    end
  end

  describe '#delete' do
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

    let(:variables) do
      {
        userDeleteInput: {
          id: user.id
        }
      }
    end

    it 'delete user' do
      result = PersonalAutoAssitatntSchema.execute(mutation, variables: variables)
      expect(result['data']['userDelete']).not_to be_empty
    end
  end

  describe '#update' do
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

    let(:variables) do
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

    it 'update user' do
      result = PersonalAutoAssitatntSchema.execute(mutation, variables: variables)
      expect(result['data']['userUpdate']).not_to be_empty
    end
  end
end
