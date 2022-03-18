require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET /index" do
    before do
      sign_in user  
      get :index
    end
    
    context 'as admin' do
      let(:user) { FactoryBot.create(:user, role: :admin) }

      it { expect(response).to have_http_status(200) }
    end
  end
end
