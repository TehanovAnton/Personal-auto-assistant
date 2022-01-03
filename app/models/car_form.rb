class CarForm
  include ActiveModel::Model

  attr_accessor :model, :year_production,
                :engine_volume, :mileage,
                :body_type, :maker, :vin,
                :fuel_type, :transmission_type,
                :documents, :parts

  def initialize(car:)
    @model = car.model
    @year_production = car.year_production
    @engine_volume = car.engine_volume
    @mileage = car.mileage
    @body_type = car.body_type
    @maker = car.maker
    @vin = car.vin
    @fuel_type = car.fuel_type
    @transmission_type = car.transmission_type
  end
end
