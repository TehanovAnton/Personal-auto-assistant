module Orders
  class OrganizationNotificationWorker
    include Sidekiq::Worker

    def perform(order_id)
      order = Order.find(order_id)

      send_notification(order)
    end

    private

    def send_notification(order)
      OrganizationMailer.with(**order_details(order)).new_order_email.deliver_later
    end

    def order_details(order)
      {
        car: order.car,
        client: order.user,
        order: order,
        organization: order.organization,
        service: order.service,
        work: order.work
      }
    end
  end
end
