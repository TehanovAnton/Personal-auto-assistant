# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CarsController, type: :controller do
  describe '#edit' do
    let(:user) { create(:user_with_car) }
    let(:car) { user.cars.first }

    before do
      sign_in user
      get :edit, params: { id: car.id }
    end

    include_examples 'set not empty controller instance variable', :fuel_types

    include_examples 'set not empty controller instance variable', :transmission_types

    include_examples 'set not empty controller instance variable', :documents

    it 'should set car_form form object' do
      car_form = assigns(:car_form)
      expect(car_form).not_to be_nil
    end
  end
end
