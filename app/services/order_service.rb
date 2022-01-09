# frozen_string_literal: true

class OrderService
  attr_accessor :services_work, :car

  def initialize(service_id:, work_id:, car_id:)
    @services_work = ServicesWork.find_by(service_id: service_id,
                                          work_id: work_id)
    @car = Car.find_by(id: car_id)
  end

  def new_order
    Order.new(services_work_id: services_work.id, car_id: car.id, mileage: car.mileage)
  end
end
