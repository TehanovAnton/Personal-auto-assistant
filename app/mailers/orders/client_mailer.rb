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

    def document_end_term_of_validity
      @client = params[:user]
      @document = params[:document]

      mail(to: @client.email, subject: 'Document term of validity | PersonalAutoAssistant')
    end
  end
end
