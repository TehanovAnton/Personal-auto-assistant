module Orders
  class OrganizationMailer < ApplicationMailer
    def new_order_email
      @organization = params[:organization]
      @client = params[:client]
      @order = params[:order]
      @car = params[:car]
      @service = params[:service]
      @work = params[:work]
      @url = order_url(@order)

      mail(to: @organization.email, subject: "New Order Notification | #{@service.name} | PersonalAutoAssistant")
    end
  end
end
