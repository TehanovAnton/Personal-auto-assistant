# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  describe '#create' do
    context 'valid params' do
      let(:service_owner) { create(:user_with_car, role: :service_owner) }
      let(:organization) do
        Category.create(name: 'basic')
        create(:organization_with_service_and_work, name: 'industries')
      end
      let(:service) { organization.services.first }
      let(:work) { service.works.last }
      let (:params) do
        {
          order: {
            service_id: service.id,
            work_id: work.id,
            car_id: service_owner.cars.first.id
          }
        } 
      end

      before { sign_in service_owner }

      it 'should permit params' do
        should permit(:service_id, :work_id, :car_id)
        .for(:create, params: params)
        .on(:order)
      end

      it 'should create new object' do
      end

      it 'should create new object with coresponding fields values' do 
      end 

      it 'should redirect to the correct path' do
      end

      it 'should respond with ok status' do
      end
    end

    context 'invalid params' do
      it 'should not create new object' do
      end

      it 'should respond wiht 422 status' do
      end
      
      it 'shuld redireect to the correct path' do
      end

      it 'should set flash' do
      end
    end
  end
end