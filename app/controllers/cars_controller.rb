# frozen_string_literal: true

class CarsController < ApplicationController
  before_action :set_car, only: %i[show edit update destroy]
  before_action :fuel_transmission_types, only: %i[new edit]
  before_action :documents, only: %i[new edit]

  def index
    @cars = Car.all
  end

  def show; end

  def new
    @car_form = CarForm.new(car: FactoryBot.build(:car))
  end

  def edit; end

  def create
    @car = Car.new(car_params)

    if @car.save && service.create_documents(documents: documents_params[:documents], user_id: documents_params[:user_id])
      redirect_to @car, notice: 'Car was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to @car, notice: 'Car was successfully updated.' }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @car.destroy
    respond_to do |format|
      format.html { redirect_to cars_url, notice: 'Car was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car_form).permit(:model, :year_production, :engine_volume, :mileage, :body_type, :fuel_type,
                                     :transmission_type, :maker, :vin, :user_id)
  end

  def documents_params
    params.require(:car_form).permit(:user_id, documents: {})
  end

  def fuel_transmission_types
    @fuel_types = Car.fuel_types
    @transmission_types = Car.transmission_types
  end

  def documents
    @documents = Document.names
  end

  def service
    @service ||= UserService.new
  end
end
