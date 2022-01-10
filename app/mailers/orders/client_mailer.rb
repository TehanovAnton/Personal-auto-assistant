# frozen_string_literal: true

module Orders
  class ClientMailer < ApplicationMailer
    def new_order_email
      @client = params[:client]
      @order = params[:order]

      mail(to: @client.email, subject: 'New Order Notification | PersonalAutoAssistant')
    end

    def document_end_term_of_validity
      @client = params[:user]
      @document = params[:document]

      mail(to: @client.email, subject: 'Document term of validity | PersonalAutoAssistant')
    end

    def car_part_last_update
      @client = params[:user]
      @part = params[:part]
      @car = params[:car]

      mail(to: @client.email, subject: 'Part last update | PersonalAutoAssistant')
    end
  end
end
