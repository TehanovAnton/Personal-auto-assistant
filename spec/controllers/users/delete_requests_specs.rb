# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe '#destroy' do
    before { sign_in user }
    let(:user) { create(:user, role: :admin) }

    context 'existent user' do
      before { delete :destroy, params: { id: user.id } }

      it { should respond_with(:redirect) }
      it { should redirect_to(action: :home) }
    end
  end
end
