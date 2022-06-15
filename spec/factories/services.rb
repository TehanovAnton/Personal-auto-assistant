# frozen_string_literal: true

FactoryBot.define do
  factory :service do
    organization_id { organization.id }
    name { 'Best service' }
    email { Faker::Internet.safe_email }
    phone_number { Faker::PhoneNumber.cell_phone }
    address { "#{Faker::Address.city}, #{Faker::Address.street_name}, #{Faker::Address.building_number}" }
  end
end

def organization
  organization = Organization.last
  organization = create(:organization, name: 'Best organization') unless organization.present?
  
  organization
end
