# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    context 'presence' do
      it { should validate_presence_of(:first_name) }
      it { should validate_presence_of(:last_name) }
      it { should validate_presence_of(:email) }
      it { should validate_presence_of(:phone_number) }
    end

    context 'length' do
      include_examples 'length of', :first_name, 2, 30
      include_examples 'length of', :last_name, 2, 30
    end

    context 'inclusion' do
      it { is_expected.to define_enum_for(:role).with(User.roles.keys) }
    end
  end
end
