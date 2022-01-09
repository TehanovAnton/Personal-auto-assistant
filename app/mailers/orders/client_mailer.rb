module Orders
  class ClientMailer < ApplicationMailer
    def new_order_email
      @client = params[:client]
      @order = params[:order]
      @car = params[:car]
      @service = params[:service]
      @work = params[:work]
      @url = order_url(@order)

      mail(to: @client.email, subject: 'New Order Notification | PersonalAutoAssistant')
    end
  end
end
