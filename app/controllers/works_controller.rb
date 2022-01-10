# frozen_string_literal: true

class WorksController < ApplicationController
  before_action :set_work, :set_service, only: %i[show edit update destroy]

  def new
    @work = Work.new
  end

  def edit
    @service_work = ServiceWork.new(@service, @work)
  end

  def create
    @work = Work.new(work_params)

    respond_to do |format|
      if @work.save
        format.html { redirect_to @work, notice: 'Work was successfully created.' }
        format.json { render :show, status: :created, location: @work }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @service_work = ServiceWork.new(@service, @work)

    if @service_work.update(service_work_params)
      redirect_to service_path(@service, organization_id: @service.organization.id),
                  notice: 'Work was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @work.destroy
    respond_to do |format|
      format.html { redirect_to works_url, notice: 'Work was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_work
    @work = Work.find(params[:id])
  end

  def set_service
    @service = Service.find_by(id: params[:service_id])
  end

  def service_work_params
    params.require(:service_work).permit(:service, :category, :title, :price)
  end
end
