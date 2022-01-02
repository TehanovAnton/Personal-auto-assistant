# frozen_string_literal: true

FactoryBot.define do
  factory :car do
    user_id { User.last.id }
    model { Faker::Vehicle.model }
    year_production { Faker::Number.between(from: 2000, to: 2015) }
    engine_volume { Faker::Number.between(from: 1, to: 3.5).floor(1) }
    mileage { Faker::Vehicle.mileage }
    body_type { Faker::Vehicle.car_type }
    fuel_type { %w[gas petrol electricity].sample }
    transmission_type { %w[automatic mechanic].sample }
    maker { Faker::Vehicle.make }
    vin { Faker::Vehicle.vin }
  end

  trait :with_user do
    user_id { FactoryBot.create(:user).id }
  end
end

FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    phone_number { Faker::PhoneNumber.cell_phone  }
    email { "#{first_name}#{last_name}@gmail.com" }
    password { 'ewqqwe' }
  end

  after(:create) { |user| user.confirm if user.is_a? User }
end
