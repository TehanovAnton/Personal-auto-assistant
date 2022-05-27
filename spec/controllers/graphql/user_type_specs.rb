# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GraphqlController, type: :controller do
  let(:user) { create(:user, role: :car_owner) }
  before { sign_in user }

  describe '#users' do
    context 'when correct request' do
      let(:query) do
        <<~GQL
          query {
            users {
              firstName
              lastName
              email
            }
          }
        GQL
      end

      it 'should return array of users' do
        result = PersonalAutoAssitatntSchema.execute(query)
        expect(result['data']['users']).not_to be_empty
      end

      it 'should return array of users with fitstName, lastName, email' do
        result = PersonalAutoAssitatntSchema.execute(query)
        expect(result['data']['users'].first['firstName']).to be
        expect(result['data']['users'].first['lastName']).to be
        expect(result['data']['users'].first['email']).to be
      end
    end

    context 'when incorrect request' do
      let(:query) do
        <<~GQL
          query {#{' '}
            users { unexistedField }#{' '}
          }
        GQL
      end

      it 'should return response with errors' do
        response = PersonalAutoAssitatntSchema.execute(query)
        expect(response['errors']).not_to be_empty
      end
    end
  end
end
