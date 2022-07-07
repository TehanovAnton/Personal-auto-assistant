
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GraphqlController, type: :controller do
  describe '#create' do
    include_examples 'mutation return response' do
      let(:mutation_resolver) { 'partCreate' }
      let(:description) { 'create part' }
      let(:mutation) do
        <<~GQL
          mutation PartCreate($partInput: PartCreateInput!) {
            partCreate(input: $partInput) {
              part {
                id
                name
              }
            }
          }
        GQL
      end
      let(:input_variables) do
        {
          partInput: {
            partInput: {
              name: 2
            }
          }
        }
      end

      before { Part.destroy_by(name: :brakes) }
    end
  end

  describe '#update' do
    include_examples 'mutation return response' do
      let(:mutation_resolver) { 'partUpdate' }
      let(:description) { 'part update' }
      let(:part) do
        user = create(:user, role: :car_owner)
        car = create(:car, user: user)

        Part.destroy_by(name: [:brakes, :motor])
        car.parts.first
      end
      let(:mutation) do
        <<~GQL
          mutation UpdatePart($partInput: PartUpdateInput!) {
            partUpdate(input: $partInput) {
              part {
                id
                name
              }
            }
          }
        GQL
      end
      let(:input_variables) do
        {
          partInput: {
            id: part.id,
            partInput: {
              name: 1
            }
          }   
        }
      end
    end
  end

  describe '#delete' do
    include_examples 'mutation return response' do
      let(:mutation_resolver) { 'partDelete' }
      let(:description) { 'part delete' }
      let(:part) do
        user = create(:user, role: :car_owner)
        create(:car, user: user)
        .parts
        .first
      end
      let(:mutation) do
        <<~GQL
          mutation DeletePart($partInput: PartDeleteInput!) {
            partDelete(input: $partInput) {
              part {
                id
                name
              }
            }
          }
        GQL
      end
      let(:input_variables) do
        {
          partInput: {
            id: part.id
          }
        }
      end
    end
  end
end