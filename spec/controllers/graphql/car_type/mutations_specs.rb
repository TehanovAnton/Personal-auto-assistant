# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GraphqlController, type: :controller do
  let(:user) { create(:user, role: :car_owner) }
  let(:car) { create(:car, user: user) }

  describe '#create' do
    include_examples 'mutation return response' do
      let(:mutation_resolver) { 'carCreate' }
      let(:description) { 'create car' }
      let(:mutation) do
        <<~GQL
          mutation CarCreate($carInput:CarCreateInput!) {
            carCreate(input:$carInput) {
                  car {
                      id
                      user {
                          id
                          email
                      }
                      maker
                      model
                      vin
                      mileage
                  }
            }
          }
        GQL
      end
      let(:input_variables) do
        {
          "carInput": {
            "carInput": {
              "userId": user.id,
              "model": 'Prius',
              "yearProduction": 2011,
              "engineVolume": 1,
              "mileage": 10_000,
              "bodyType": 'Wagon',
              "maker": 'Nissan',
              "vin": 'M30129K45C18T9894',
              "fuelType": 0
            }
          }
        }
      end
    end
  end

  describe '#update' do
    include_examples 'mutation return response' do
      let(:mutation_resolver) { 'carUpdate' }
      let(:description) { 'update car' }
      let(:mutation) do
        <<~GQL
          mutation CarUpdate($carInput:CarUpdateInput!) {
            carUpdate(input:$carInput) {
              car {
                id
                user {
                  id
                  email
                }
                maker
                model
                vin
                mileage
              }
            }
          }
        GQL
      end
      let(:input_variables) do
        {
          "carInput": {
            "id": car.id,
            "carInput": {
              "userId": user.id,
              "model": 'Maclaren',
              "yearProduction": 2005,
              "engineVolume": 1,
              "mileage": 10_000,
              "bodyType": 'Wagon',
              "maker": 'Nissan',
              "vin": 'M30129K45C18T9894',
              "fuelType": 0
            }
          }
        }
      end
    end
  end

  describe '#delete' do
    include_examples 'mutation return response' do
      let(:mutation_resolver) { 'carDelete' }
      let(:description) { 'delete car' }
      let(:mutation) do
        <<~GQL
          mutation CarDelete($carInput:CarDeleteInput!) {
            carDelete(input:$carInput) {
              car {
                id
                user {
                  id
                  email
                }
                maker
                model
                vin
                mileage
              }
            }
          }
        GQL
      end
      let(:input_variables) do
        {
          "carInput": {
            "id": car.id
          }
        }
      end
    end
  end
end
