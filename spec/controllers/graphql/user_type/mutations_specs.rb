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

    let(:query) do
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
      result = PersonalAutoAssitatntSchema.execute(query, variables: userInput)
      expect(result['data']['userCreate']).not_to be_empty
    end
  end
end
