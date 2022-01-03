# frozen_string_literal: true

class OrganizationsController < ApplicationController
  before_action :set_organization, only: %i[show edit destroy]
  before_action :set_cities, only: %i[new edit]

  before_action -> { organization(organization_id: params[:id]) },
                :organization_service,
                only: %i[create update]

  attr_accessor :service

  def index
    @organizations = Organization.all
  end

  def show; end

  def new
    @organization = Organization.new
  end

  def edit; end

  def create
    if service.save_organization_and_cities_organization
      redirect_to @organization, notice: 'Organization was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if service.update_organization_and_cities_organization(organization_params)
      redirect_to @organization, notice: 'Organization was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @organization.destroy
      redirect_to organizations_url, notice: 'Organization was successfully destroyed.'
    else
      render :destroy, status: :unprocessable_entity
    end
  end

  private

  def set_organization
    @organization = Organization.find(params[:id])
  end

  def set_cities
    @cities = City.all
  end

  def organization(organization_id: nil)
    @organization = organization_id ? Organization.find_by(id: organization_id) : Organization.new(organization_params)
  end

  def organization_service
    @service = OrganizationService.new(organization: @organization, city_ids: city_ids)
  end

  def organization_params
    params.require(:organization).permit(:email, :phone_number, :adress, :name)
  end

  def city_ids
    city_ids = params.require(:organization).permit(city_ids: [])[:city_ids]
    city_ids.select { |id| id unless id.empty? }.map(&:to_i)
  end
end
