# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GraphqlController, type: :controller do
  let(:user) { organization.service_owner }
  let!(:organization) do
    create(:organization_with_service_and_work, name: 'best company')
  end
  let(:car) { create(:car_with_orders, user: user) }
  before { sign_in user }

  describe '#services' do
    context 'when query correct' do
      include_examples "graphql request shouldn't to be empty",
                       'services' do
        let(:query) do
          <<~GQL
            query {
              services(organizationId: #{organization.id}) {
                name
                address
                phoneNumber
                organization {
                  name
                }
              }
            }
          GQL
        end
      end
    end
  end

  describe '#service' do
    context 'when query correct' do
      include_examples "graphql request shouldn't to be empty",
                       'service' do
        let(:query) do
          <<~GQL
            query {
              service(organizationId: #{organization.id}, serviceId: #{organization.services.last.id}) {
                id
                name
                address
                phoneNumber
                organization {
                  name
                }
              }
            }
          GQL
        end
      end
    end
  end
end
