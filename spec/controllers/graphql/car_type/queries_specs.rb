# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GraphqlController, type: :controller do
  let(:user) { create(:user, role: :car_owner) }
  before { sign_in user }

  describe '#cars' do
    let(:query) do
      <<~GQL
        query {
          cars {
            userId
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

    it 'should return array of cars' do
      result = PersonalAutoAssitatntSchema.execute(query)

      binding.pry
      expect(result['data']['cars']).not_to be_empty
    end
  end
end
