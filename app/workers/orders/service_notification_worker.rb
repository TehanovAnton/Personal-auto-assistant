# frozen_string_literal: true

module Orders
  class ServiceNotificationWorker
    include Sidekiq::Worker

    def perform(order_id)
      order = Order.find(order_id)

      send_notification(order)
    end

    private

    def send_notification(order)
      ServiceMailer.with(**order_details(order)).new_order_email.deliver_later
    end

    def order_details(order)
      {
        car: order.car,
        client: order.user,
        order: order,
        service: order.service,
        work: order.work
      }
    end
  end
end
