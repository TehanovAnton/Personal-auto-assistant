# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GraphqlController, type: :controller do
  let(:user) { create(:user, role: :car_owner) }
  let!(:consumable_category) { ConsumableCategory.create(name: 'Fuel') }
  let(:car) { create(:car, user: user) }

  describe '#create' do
    before { car.consumables.destroy_all }

    include_examples 'mutation return response' do
      let(:mutation_resolver) { 'consumableCreate' }
      let(:description) { 'create consumable' }      
      let(:mutation) do
        <<~GQL
        mutation ConsumableCreate($consumableInput:ConsumableCreateInput!) {
          consumableCreate(input:$consumableInput) {
            consumable {
              id
              name
              car {
                id
                maker
              }
              value
            }
          }
        }
        GQL
      end
      let(:input_variables) do
        {
          "consumableInput": {
                "consumableInput": {
                "consumableCategoryId": consumable_category.id,
                "carId": car.id,
                "value": 100
                }
          }
        }
      end
    end
  end

  describe '#update' do
    include_examples 'mutation return response' do
      let(:mutation_resolver) { 'consumableUpdate' }
      let(:description) { 'update consumable' }
      let(:mutation) do
        <<~GQL
        mutation ConsumableUpdate($consumableInput:ConsumableUpdateInput!) {
          consumableUpdate(input:$consumableInput) {
            consumable {
              id
              name
              car {
                id
                maker
              }
              value
            }
          }
        }
        GQL
      end
      let(:input_variables) do
        {
          "consumableInput": {
                "id": car.consumables.first.id,
                "consumableInput": {
                "consumableCategoryId": consumable_category.id,
                "carId": car.id,
                "value": 123
                }
          }
        }
      end
    end
  end

  describe '#delete' do
    include_examples 'mutation return response' do
      let(:mutation_resolver) { 'consumableDelete' }
      let(:description) { 'delete consumable' }
      let(:mutation) do
        <<~GQL
        mutation ConsumableDelete($consumableInput:ConsumableDeleteInput!) {
          consumableDelete(input:$consumableInput) {
            consumable {
              id
              name
              car {
                id
                maker
              }
              value
            }
          }
        }
        GQL
      end
      let(:input_variables) do
        {
          "consumableInput": {
            "id": car.consumables.first.id
          }
        }
      end
    end
  end
end
