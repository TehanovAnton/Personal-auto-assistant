# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'PUT' do
    before { sign_in user }
    let(:user) { FactoryBot.create(:user) }

    describe '#update' do
      let(:params) do
        { user: { first_name: 'new', last_name: 'new', phone_number: '1234', email: 'newone@gmail.com' }, id: user.id }
      end

      it 'permit params' do
        should permit(:first_name, :last_name, :email, :phone_number)
          .for(:update, params: params)
          .on(:user)
      end

      context 'valid params' do
        before { put :update, params: params }

        it { should redirect_to(action: :show) }
      end

      context 'invalid params' do
        let(:params) { { user: { first_name: 'a' }, id: user.id } }
        before { put :update, params: params }

        it { should respond_with(:unprocessable_entity) }
        it { should render_template(:edit) }
      end
    end
  end
end
