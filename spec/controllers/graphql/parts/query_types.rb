# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GraphqlController, type: :controller do
  let(:user) { create(:user, role: :car_owner) }
  let(:car) { create(:car_with_orders, user: user) }
  before { sign_in user }

  describe '#parts' do
    context 'when query correct' do
      include_examples "graphql request shouldn't to be empty", 'parts' do
        let(:query) do
          <<~GQL
            query {
              parts(carId: #{car.id}) {
                name
              }
            }
          GQL
        end
      end
    end
  end

  describe '#part' do
    context 'when query correct' do
      include_examples "graphql request shouldn't to be empty", 'part' do
        let(:query) do
          <<~GQL
            query {
              part(carId: #{car.id}, partId: #{car.parts.first.id}) {
                name
              }
            }
          GQL
        end
      end
    end
  end
end
