# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GraphqlController, type: :controller do
  let(:user) { create(:user, role: :car_owner) }
  let(:document) { Document.create(name: :license) }

  describe '#create' do
    before { user.documents.destroy_all }

    include_examples 'mutation return response' do
      let(:mutation_resolver) { 'carsOwnersDocumentCreate' }
      let(:description) { 'create carsOwnersDocument' }      
      let(:mutation) do
        <<~GQL
        mutation CarsOwnersDocumentCreate($carsOwnersDocumentInput:CarsOwnersDocumentCreateInput!) {
          carsOwnersDocumentCreate(input:$carsOwnersDocumentInput) {
            carsOwnersDocument {
              id
              user {
                    id
                    email
            }
              documentId
              issueDate
              termOfValidity
            }
          }
        }
        GQL
      end
      let(:input_variables) do
        {
          "carsOwnersDocumentInput": {
                "carsOwnersDocumentInput": {
                    "userId": user.id,
                    "documentId": document.id,
                    "issueDate": "2022-06-06",
                    "termOfValidity": 30
                }
          }
        }
      end
    end
  end

  describe '#update' do
    include_examples 'mutation return response' do
      let(:mutation_resolver) { 'carsOwnersDocumentUpdate' }
      let(:description) { 'update carsOwnersDocument' }
      let(:mutation) do
        <<~GQL
        mutation CarsOwnersDocumentUpdate($carsOwnersDocumentInput:CarsOwnersDocumentUpdateInput!) {
          carsOwnersDocumentUpdate(input:$carsOwnersDocumentInput) {
            carsOwnersDocument {
              id
              user {
                id
                email
              }
              documentId
              issueDate
              termOfValidity
            }
          }
        }
        GQL
      end
      let(:input_variables) do
        {
          "carsOwnersDocumentInput": {
            "id": user.cars_owners_documents.first.id,
                "carsOwnersDocumentInput": {
                    "userId": user.id,
                    "documentId": document.id,
                    "issueDate": "2022-06-12",
                    "termOfValidity": 50
                }
          }
        }
      end
    end
  end

  describe '#delete' do
    include_examples 'mutation return response' do
      let(:mutation_resolver) { 'carsOwnersDocumentDelete' }
      let(:description) { 'delete carsOwnersDocument' }
      let(:mutation) do
        <<~GQL
        mutation CarsOwnersDocumentDelete($carsOwnersDocumentInput:CarsOwnersDocumentDeleteInput!) {
          carsOwnersDocumentDelete(input:$carsOwnersDocumentInput) {
            carsOwnersDocument {
              id
              user {
                id
                email
              }
              documentId
              issueDate
              termOfValidity
            }
          }
        }
        GQL
      end
      let(:input_variables) do
        {
          "carsOwnersDocumentInput": {
            "id": user.cars_owners_documents.first.id
          }
        }
      end
    end
  end
end
