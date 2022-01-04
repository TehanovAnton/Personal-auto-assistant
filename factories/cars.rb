# frozen_string_literal: true

FactoryBot.define do
  factory :car do
    user_id { User.last.id }
    model { Faker::Vehicle.model }
    year_production { Faker::Number.between(from: 2000, to: 2015) }
    engine_volume { Faker::Number.between(from: 1, to: 3.5).floor(1) }
    mileage { Faker::Vehicle.mileage }
    body_type { Faker::Vehicle.car_type }
    fuel_type { %i[gas petrol electricity].sample }
    transmission_type { %i[automatic mechanic].sample }
    maker { Faker::Vehicle.make }
    vin { Faker::Vehicle.vin }

    after(:create) do |car|
      create(:consumable)
      car.consumables = Consumable.all
      car.reload
    end
  end
end
