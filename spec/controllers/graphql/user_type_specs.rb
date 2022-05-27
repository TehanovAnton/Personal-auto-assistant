# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GraphqlController, type: :controller do
  let(:user) { create(:user, role: :car_owner) }

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

      before { sign_in user }

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
  end
end
