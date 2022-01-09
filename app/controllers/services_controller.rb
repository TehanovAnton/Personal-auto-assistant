# frozen_string_literal: true

class ServicesController < ApplicationController
  before_action :set_service, only: %i[show edit update destroy]
  before_action :set_organization, only: %i[index show new create edit]

  def index
    @services = @organization.services.page params[:page]
  end

  def show
    @comments = @service.comments.page params[:page]
  end

  def new
    @service = Service.new
  end

  def edit; end

  def create
    @service = Service.new(service_params)

    if @service.save
      redirect_to service_path(@service, organization_id: @service.organization.id),
                  notice: 'Service was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @service.update(service_params)
      redirect_to service_path(@service, organization_id: @service.organization.id),
                  notice: 'Service was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url, notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_service
    @service = Service.find(params[:id])
  end

  def set_organization
    @organization = Organization.find_by(id: params[:organization_id])
  end

  def service_params
    params.require(:service).permit(:name, :email, :address, :phone_number, :organization_id)
  end
end
