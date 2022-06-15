# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GraphqlController, type: :controller do
  let(:car) { create(:car, user: user) }
  let(:user) { create(:user, role: :car_owner) }
  before { sign_in user }

  describe '#cars' do
    context 'car owner cars' do
      include_examples "graphql query result should to be", 'cars' do
        let(:query) do
          <<~GQL
            query {
              cars {
                user {
                  firstName
                  lastName
                }
                model
                yearProduction
                engineVolume
                mileage
                bodyType
                maker
                vin
                fuelType
                transmissionType
              }
            }
          GQL
        end
      end
    end
  end

  describe '#car' do
    context 'specified car' do
      include_examples "graphql query result shouldn't to be empty", 'car' do
        let(:query) do
          <<~GQL
            query {
              car(id: #{car.id}) {
                user {
                  firstName
                  lastName
                }
                model
                yearProduction
                engineVolume
                mileage
                bodyType
                maker
                vin
                fuelType
                transmissionType
              }
            }
          GQL
        end
      end
    end
  end
end
