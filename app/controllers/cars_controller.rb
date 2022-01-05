# frozen_string_literal: true

class CarsController < ApplicationController
  before_action :set_car, only: %i[show edit update destroy]
  before_action :fuel_types, :transmission_types, :documents, only: %i[new edit]

  def index
    @cars = Car.all
  end

  def show; end

  def new
    @car_form = CarForm.new(car: FactoryBot.build(:car))
  end

  def edit
    @car_form = CarForm.new(car: @car)
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to @car, notice: 'Car was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @car.update(car_params)
      redirect_to @car, notice: 'Car was successfully updated.'
    else
      redirect_to :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @car.destroy
    redirect_to cars_url, notice: 'Car was successfully destroyed.'
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car_form).permit(:model, :year_production, :engine_volume, :mileage, :body_type, :fuel_type,
                                     :transmission_type, :maker, :vin, :user_id)
  end

  def fuel_types
    @fuel_types = Car.fuel_types
  end

  def transmission_types
    @transmission_types = Car.transmission_types
  end

  def documents
    @documents = Document.names
  end

  def service
    @service ||= UserService.new
  end
end