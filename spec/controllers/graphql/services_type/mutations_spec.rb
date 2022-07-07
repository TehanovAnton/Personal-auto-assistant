# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GraphqlController, type: :controller do
  describe '#create' do
    include_examples 'mutation return response' do
      let(:organization) { create(:organization, name: 'NewOrganization') }
      let(:mutation_resolver) { 'serviceCreate' }
      let(:description) { 'create service' }
      let(:mutation) do
        <<~GQL
          mutation ServiceCreate($servicesInput: ServiceCreateInput!) {
            serviceCreate(input: $servicesInput) {
              service {
                id
                name
                works {
                  id,
                  title
                  categoryId
                }
              }
            }
          }
        GQL
      end
      let(:input_variables) do
        {
          servicesInput: {
            serviceInput: {
              name: "new service",
              email: "new_service@gmail.com",
              phoneNumber: "12345678",
              address: "Mihalkova 15",
              organizationId: organization.id
            }
          }
        }
      end
    end
  end

  describe '#update' do
    include_examples 'mutation return response' do
      let(:service) do
        create(:organization_with_service_and_work, name: 'NewOrganization')
        .services
        .first
      end
      let(:mutation_resolver) { 'serviceUpdate' }
      let(:description) { 'update service' }
      let(:mutation) do
        <<~GQL
          mutation UpdateService($serviceInput: ServiceUpdateInput!) {
            serviceUpdate(input: $serviceInput) {
              service {
                id
                name
                works {
                  id,
                  title
                  categoryId
                }
              }
            }
          }
        GQL
      end
      let(:input_variables) do
        {
          serviceInput: {
            id: service.id,
            serviceInput: {
              address: service.address + ' updated',
              phoneNumber: '12345678987654',
            }
          }
        }
      end
    end
  end

  describe '#delete' do
    include_examples 'mutation return response' do
      let(:mutation_resolver) { 'serviceDelete' }
      let(:description) { 'delete service' }
      let(:service) do
        create(:organization_with_service_and_work, name: 'NewOrganization')
        .services
        .first
      end
      let(:mutation) do
        <<~GQL
          mutation DeleteService($servicesInput: ServiceDeleteInput!) {
            serviceDelete(input: $servicesInput) {
              service {
                id
                name
                works {
                  id,
                  title
                  categoryId
                }
              }
            }
          }
        GQL
      end
      let(:input_variables) do
        {
          servicesInput: {
            id: service.id
          }
        }
      end
    end
  end
end