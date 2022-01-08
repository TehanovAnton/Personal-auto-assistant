# frozen_string_literal: true

json.extract! order, :id, :organizations_services_works_price_id, :car_id, :created_at, :updated_at
json.url order_url(order, format: :json)
