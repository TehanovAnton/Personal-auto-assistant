# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GraphqlController, type: :controller do
  let(:user) { create(:user_with_documents, role: :service_owner) }
  before { sign_in user }

  describe '#organizations' do
    let(:user_organization_query) do
      <<~GQL
        query {
          organizations(userId: #{user.id}) {
            id
            name
            email
            phoneNumber
            address
            serviceOwnerId
          }
        }
      GQL
    end

    let(:organizations_query) do
      <<~GQL
        query {
          organizations {
            id
            name
            email
            phoneNumber
            address
            serviceOwnerId
          }
        }
      GQL
    end

    it 'should reutrn array of organisations' do
      result = PersonalAutoAssitatntSchema.execute(user_organization_query)
      expect(result['data']['organizations']).not_to be_empty
    end

    it 'should reutrn array of user organisations' do
      result = PersonalAutoAssitatntSchema.execute(organizations_query)
      expect(result['data']['carsOwnersDocuments']).not_to be_empty
    end
  end
end
