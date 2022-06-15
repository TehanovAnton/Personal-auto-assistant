# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GraphqlController, type: :controller do
  let(:user) { create(:user, role: :car_owner) }
  let!(:consumable_category) { ConsumableCategory.create(name: 'Fuel') }
  let(:car) { create(:car, user: user) }
  before { sign_in user }

  describe '#consumables' do
    context 'when order has comments' do
      include_examples "graphql request shouldn't to be empty",
                       'consumables' do
        let(:query) do
          <<~GQL
            query {
              consumables(carId: #{car.id}) {
                name
                car {
                  maker
                }
              }
            }
          GQL
        end
      end
    end
  end

  describe '#consumable' do
    context 'when order has comments' do
      include_examples "graphql request shouldn't to be empty",
                       'consumable' do
        let(:query) do
          <<~GQL
            query {
              consumable(carId: #{car.id}, consumableCategoryId: #{car.consumables.first.consumable_category_id}) {
                name
                car {
                  maker
                }
              }
            }
          GQL
        end
      end
    end
  end
end
