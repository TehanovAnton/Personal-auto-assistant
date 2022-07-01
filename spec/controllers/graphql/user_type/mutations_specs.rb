require 'rails_helper'

RSpec.describe GraphqlController, type: :controller  do
  describe '#create' do
    let(:userInput) do
      {
        userInput: {
          userInput: {
            firstName: "osavldo",
            lastName: "lugones",
            email: "lugones@gmail.com",
            phoneNumber: "12345",
            role: 0,
            password: "ewqqwe"
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
      binding.pry
      result = PersonalAutoAssitatntSchema.execute(mutation, variables: userInput)
      expect(result['data']['userCreate']).not_to be_empty
    end
  end

  describe '#delete' do
    let(:user) { create(:user, role: :car_owner) }
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
end
