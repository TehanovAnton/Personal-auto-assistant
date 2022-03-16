require 'rails_helper'

RSpec.describe User, type: :model do
  context 'example' do
    let(:user) { FactoryBot.build(:user_with_car) }

    it { expect(user).not_to be_nil }
  end
end
