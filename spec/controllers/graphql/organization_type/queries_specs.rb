# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GraphqlController, type: :controller do
  let(:organization) do
    create(:organization_with_service_and_work, name: 'best company')
  end
  let(:user) { organization.service_owner }
  before { sign_in user }

  describe '#organizations' do
    context 'service owner organizations' do
      include_examples "graphql request shouldn't to be empty",
                       'organizations' do
        let(:query) do
          <<~GQL
            query {
              organizations(serviceOwnerId: #{user.id}) {
                id
                email
                phoneNumber
                address
                serviceOwner {
                  firstName
                  lastName
                }
              }
            }
          GQL
        end
      end
    end
  end

  describe '#organization' do
    context 'specified organization' do
      include_examples "graphql request shouldn't to be empty",
                       'organization' do
        let(:query) do
          <<~GQL
            query {
              organization(serviceOwnerId: #{user.id}, organizationId: #{organization.id}) {
                id
                email
                phoneNumber
                address
                serviceOwner {
                  firstName
                  lastName
                }
              }
            }
          GQL
        end
      end
    end
  end
end
