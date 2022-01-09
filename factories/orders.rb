# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    services_work_id {}
    mileage {}
    car_id {}
  end
end
