# frozen_string_literal: true

json.extract! car, :id, :model, :year_production,
              :engine_volume, :mileage, :body_type,
              :fuel_type, :transmission_type, :maker,
              :vin, :created_at, :updated_at
json.url car_url(car, format: :json)
