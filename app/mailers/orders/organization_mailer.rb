# frozen_string_literal: true

module Orders
  class OrganizationMailer < ApplicationMailer
    def new_order_email
      @organization = params[:organization]
      @client = params[:client]
      @order = params[:order]
      @url = order_url(@order)
      mail(to: @organization.email, subject: "New Order Notification | #{@order.service.name} | PersonalAutoAssistant")
    end
  end
end
