# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GraphqlController, type: :controller do
  describe '#create' do
    include_examples 'mutation return response' do
      let(:mutation_resolver) { 'organizationCreate' }
      let(:description) { 'create organization' }
      let(:service_owner) { create(:user, role: :service_owner) }
      let(:mutation) do
        <<~GQL
          mutation OrganizationCreate($organizationInput: OrganizationCreateInput!) {
            organizationCreate(input:$organizationInput) {
              organization {
                id
                serviceOwner {
                  id
                  lastName
                }
                email
                address
                services {
                  id
                  name
                  address
                }
              }
            }
          }
        GQL
      end
      let(:input_variables) do
        {
          organizationInput: {
            organizationInput: {
              name: "neworg",
              email: "neworg@gmail.com",
              phoneNumber: "12345678",
              address: "neworg 23",
              serviceOwnerId: service_owner.id
            }
          }
      }
      end
    end
  end

  describe '#update' do
    include_examples 'mutation return response' do
      let(:mutation_resolver) { 'organizationUpdate' }
      let(:description) { 'update organization' }
      let(:organization) { create(:organization, name: 'NewOrg') }
      let(:mutation) do
        <<~GQL
          mutation OrganizationUpdate($organizationInput:OrganizationUpdateInput!) {
            organizationUpdate(input:$organizationInput) {
              organization {
                id
                serviceOwner {
                  id
                  lastName
                }
                email
                address
                services {
                  id
                  name
                  address
                }
              }
            }
          }
        GQL
      end
      let(:input_variables) do
        {
          organizationInput: {
            id: organization.id,
            organizationInput: {
              name: "newestOrg",
              address: "newestOrg 23"        
            }
          }
        }
      end
    end
  end

  describe '#delete' do
    include_examples 'mutation return response' do
      let(:mutation_resolver) { 'organizationDelete' }
      let(:description) { 'delete organization' }
      let(:organization) { create(:organization, name: 'NewOrg') }
      let(:mutation) do
        <<~GQL
          mutation OrganizationDelete($organizationInput:OrganizationDeleteInput!) {
            organizationDelete(input:$organizationInput) {
              organization {
                id
                serviceOwner {
                  id
                  lastName
                }
                email
                address
                services {
                  id
                  name
                  address
                }
              }
            }  
          }
        GQL
      end
      let(:input_variables) do
        {
          organizationInput: {
            id: organization.id,
          }
        }
      end
    end
  end
end