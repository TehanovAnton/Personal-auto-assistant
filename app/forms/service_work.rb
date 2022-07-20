# frozen_string_literal: true

class ServiceWork
  include ActiveModel::Model

  attr_accessor :service, :work, :price

  delegate :title, to: :work
  delegate :category, to: :work

  def initialize(service, work)
    @service = service
    @work = work
    @organization_work = OrganizationsWork.find_by(organization_id: @service.organization.id,
                                                   work_id: @work.id)
    @price = @organization_work.price
  end

  def update(params)
    work.update(category_id: params[:category],
                title: params[:title]) && @organization_work.update(price: params[:price])
  end
end
