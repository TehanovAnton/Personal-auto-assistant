# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GraphqlController, type: :controller do
  let(:user) { create(:user, role: :car_owner) }
  before { sign_in user }

  describe '#users' do
    context 'when correct query' do
      include_examples "graphql query result shouldn't to be empty", 'users' do
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
      end
    end

    context 'when incorrect query' do
      let(:query) do
        <<~GQL
          query {
            users { unexistedField }
          }
        GQL
      end

      it 'should return response with errors' do
        response = PersonalAutoAssitatntSchema.execute(query)
        expect(response['errors']).not_to be_empty
      end
    end
  end

  describe '#user' do
    context 'when correct query' do
      include_examples "graphql query result should to be", 'user' do
        let(:query) do
          <<~GQL
            query {
              user(id: #{user.id}) {
                firstName
                lastName
                email
                phoneNumber
                role
              }
            }
          GQL
        end
      end
    end
  end
end
