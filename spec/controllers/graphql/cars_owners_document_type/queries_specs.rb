# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GraphqlController, type: :controller do
  let(:user) { create(:user, role: :car_owner) }
  before { sign_in user }

  describe '#documents' do
    context 'when car owner has documents' do
      include_examples "graphql query result shouldn't to be empty", 'carsOwnersDocuments' do 
        let(:query) do
          <<~GQL
            query {
              carsOwnersDocuments(userId: #{user.id}) {
                user {
                  firstName
                  lastName
                }
                documentId
                issueDate
                termOfValidity
              }
            }
          GQL
        end
      end
    end
  end

  describe '#document' do
    include_examples "graphql query result shouldn't to be empty", 'carsOwnersDocument' do
      let(:query) do
        <<~GQL
          query {
            carsOwnersDocument(id: #{user.documents.first.id}) {
              user{
                lastName
                firstName
              }
              documentId
              issueDate
              termOfValidity
            }
          }
        GQL
      end
    end
  end
end
