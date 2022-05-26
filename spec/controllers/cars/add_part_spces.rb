# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CarsController, type: :controller do
  let(:user) { create(:user, role: :car_owner) }
  let(:car) { create(:car, user_id: user.id) }
  let(:part) { car.parts.first }
  let(:add_part_params) { { id: car.id, car: { parts: [part.id] } } }

  describe '#add_part' do
    context 'when add new' do
      before do
        sign_in user
        car.parts.destroy(part)
      end

      it 'should increase car part count' do
        expect { put :add_part, params: add_part_params }
          .to change { car.parts.size }.by(1)
      end

      it 'should add part' do
        put :add_part, params: add_part_params
        expect(car.parts.first).to eq(part)
      end
    end
  end

  describe '#add_part' do
    context 'when add existent' do
      before { sign_in user }

      it 'should not add part' do
        expect { put(:add_part, params: add_part_params) }
          .to_not change { car.parts }
      end
    end

    context 'when add not exitent' do
      let(:add_part_params) { { id: car.id, car: { parts: [-1] } } }
      before { sign_in user }
    end
  end
end
