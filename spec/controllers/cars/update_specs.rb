# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CarsController, type: :controller do
  describe '#update' do
    let(:user) { create(:user) }
    let(:car) do
      create(:car, user_id: user.id, engine_volume: 1,
                   fuel_type: :petrol, maker: 'Honda')
    end
    let(:params) do
      {
        car_form: {
          user_id: user.id,
          engine_volume: 2,
          fuel_type: :gas,
          maker: 'BMW'
        },
        id: car.id
      }
    end

    before { sign_in user }

    context 'valid params' do
      it 'permit params' do
        should permit(:model, :year_production, :engine_volume, :mileage,
                      :body_type, :fuel_type, :transmission_type, :maker,
                      :vin, :user_id)
          .for(:update, params: params)
          .on(:car_form)
      end

      it 'update car' do
        expect { put :update, params: params }.to change { car.reload.maker }.from('Honda').to('BMW')
      end

      it 'redirect to show' do
        put :update, params: params
        should redirect_to(action: :show)
      end
    end

    context 'invalid params' do
      let(:params) do
        {
          car_form: { user_id: user.id, engine_volume: 0 },
          id: car.id
        }
      end

      it 'not cahnge params' do
        expect { put :update, params: params }
          .not_to change { car }
      end

      it 'has http_status' do
        put :update, params: params
        should respond_with(:unprocessable_entity)
      end
    end
  end
end
