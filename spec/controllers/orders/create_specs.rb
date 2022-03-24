# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  describe '#create' do
    let(:service_owner) { create(:user_with_car, role: :service_owner) }
    let(:organization) do
      Category.create(name: 'basic')
      create(:organization_with_service_and_work, name: 'industries')
    end
    let(:service) { organization.services.first }
    let(:work) { service.works.last }

    before { sign_in service_owner }

    context 'valid params' do
      let (:params) do
        {
          order: {
            service_id: service.id,
            work_id: work.id,
            car_id: service_owner.cars.first.id
          }
        } 
      end

      it 'should permit params' do
        should permit(:service_id, :work_id, :car_id)
        .for(:create, params: params)
        .on(:order)
      end

      it 'should create new object' do
        expect { post :create, params: params }
        .to change { Order.count }.by(1)
      end

      context 'when creat' do
        before { post :create, params: params }

        it 'should set correct work id' do
          expect(Order.last.work.id).to equal(work.id)
        end

        it 'should set correct service' do
          expect(Order.last.service.id).to equal(service.id)
        end 

        it 'should redirect to the correct path' do
          should redirect_to(action: :show)
        end

        it 'should respond with ok status' do
          should respond_with(302)
        end
      end
    end

    context 'invalid params' do
      let (:params) do
        {
          order: {
            service_id: service.id,
            work_id: work.id,
            car_id: -1
          }
        } 
      end

      it 'should not create new object' do
        expect { post :create, params: params }
        .not_to change { Order.count }
      end

      it 'should render new' do
        post :create, params: params
        should render_template(:new)
      end
    end
  end
end