# frozen_string_literal: true

module Orders
  class ServiceMailer < ApplicationMailer
    def new_order_email
      @client = params[:client]
      @order = params[:order]
      @car = params[:car]
      @service = params[:service]
      @work = params[:work]
      @url = order_url(@order)

      mail(to: @service.email, subject: 'New Order Notification | PersonalAutoAssistant')
    end
  end
end
