# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GraphqlController, type: :controller do
  let(:user) { create(:user, role: :car_owner) }
  let(:service) do
    create(:organization_with_service_and_work, name: 'NewOrganization')
      .services
      .first
  end
  let(:car) { create(:car_with_orders, user: user) }

  describe '#create' do
    include_examples 'mutation return response' do
      let(:mutation_resolver) { 'orderCreate' }
      let(:description) { 'create order' }      
      let(:mutation) do
        <<~GQL
        mutation OrderCreate($orderInput:OrderCreateInput!) {
          orderCreate(input: $orderInput) {
            order {
                id
              service {
                id
                name
              }
              car {
                id
                maker
              }
              work {
                id
                title 
              }
            }
          }
        }
        GQL
      end
      let(:input_variables) do
        {
          "orderInput": {
            "orderInput": {
              "carId": car.id,
              "servicesWorkId": service.services_works.first.id,
              "mileage": 100
            }
          }
        }
      end
    end
  end

  describe '#update' do
    include_examples 'mutation return response' do
      let(:mutation_resolver) { 'orderUpdate' }
      let(:description) { 'update order' }
      let(:mutation) do
        <<~GQL
        mutation OrderUpdate($orderInput:OrderUpdateInput!) {
          orderUpdate(input:$orderInput) {
                order {
                    id
                    service {
                        id
                        name
                    }
                    car {
                        id
                        maker
                    }
                    work {
                        id
                        title 
                    }
                }
          }
        }
        GQL
      end
      let(:input_variables) do
        {
          "orderInput": {
            "id": car.orders.first.id,
            "orderInput": {
              "mileage": 1000
            }
          }
        }
      end
    end
  end

  describe '#delete' do
    include_examples 'mutation return response' do
      let(:mutation_resolver) { 'orderDelete' }
      let(:description) { 'delete order' }
      let(:mutation) do
        <<~GQL
        mutation OrderDelete($orderInput:OrderDeleteInput!) {
          orderDelete(input:$orderInput) {
            order {
              id
                    service {
                        id
                        name
                    }
                    car {
                        id
                        maker
                    }
                    work {
                        id
                        title 
                    }
            }
          }
        }
        GQL
      end
      let(:input_variables) do
        {
          "orderInput": {
            "id": car.orders.first.id
          }
        }
      end
    end
  end
end
