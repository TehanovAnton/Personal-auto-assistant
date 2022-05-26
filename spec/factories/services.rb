# frozen_string_literal: true

FactoryBot.define do
  factory :service do
    organization_id {}
    name {}
    email { Faker::Internet.safe_email }
    phone_number { Faker::PhoneNumber.cell_phone }
    address { "#{Faker::Address.city}, #{Faker::Address.street_name}, #{Faker::Address.building_number}" }
  end
end
