class OrganizationsController < ApplicationController
  before_action :set_organization, only: %i[show edit update destroy]
  before_action :set_cities, only: %i[new create edit update]

  def index
    @organizations = Organization.all
  end

  def show
  end

  def new
    @organization = Organization.new
  end

  def edit
  end

  def create
    @organization = Organization.new(organization_params)
    saved = service.save(organization: @organization, city_ids: city_ids)

    redirect_to organization_path(@organization), notice: 'Organization was successfully created.' if saved
    render :new, status: :unprocessable_entity unless saved
  end

  def update
    respond_to do |format|
      if @organization.update(organization_params)
        format.html { redirect_to @organization, notice: "Organization was successfully updated." }
        format.json { render :show, status: :ok, location: @organization }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @organization.destroy
    respond_to do |format|
      format.html { redirect_to organizations_url, notice: "Organization was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def service
    @service ||= OrganizationService.new
  end

  def set_organization
    @organization = Organization.find(params[:id])
  end

  def set_cities
    @cities = City.all
  end

  def organization_params
    params.require(:organization).permit(:email, :phone_number, :adress, :name)
  end

  def city_ids
    params.require(:organization).permit(city_ids: [])
  end
    
end
