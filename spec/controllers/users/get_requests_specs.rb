# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET' do
    let(:user) { FactoryBot.create(:user, role: :admin) }
    before { sign_in user }

    context '#home' do
      before { get :home }
      it { expect(response).to have_http_status(200) }
      it { should render_template('home') }
    end

    context '#index' do
      before { get :index }
      it { expect(response).to have_http_status(200) }
      it { should render_template('index') }
    end

    context '#show' do
      before { get(:show, params: { id: user.id }) }
      it { expect(response).to have_http_status(200) }
      it { should render_template('show') }
    end

    context '#edit' do
      before { get(:edit, params: { id: user.id }) }
      it { expect(response).to have_http_status(200) }
      it { should render_template('edit') }
    end
  end
end
