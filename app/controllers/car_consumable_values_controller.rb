# frozen_string_literal: true

class CarConsumableValuesController < ApplicationController
  before_action :set_car_consumable_value, only: %i[edit update]

  def index
    @car_consumable_values = CarConsumableValue.where(car_id: params[:car_id])
    authorize @car_consumable_values
  end

  def edit
    authorize @car_consumable_value
  end

  def update
    authorize @car_consumable_value

    if @car_consumable_value.update(car_consumable_value_params)
      redirect_to car_consumable_values_path(car_id: car_consumable_value_params[:car_id]),
                  notice: 'Car consumable value was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_car_consumable_value
    @car_consumable_value = CarConsumableValue.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def car_consumable_value_params
    params.require(:car_consumable_value).permit(:value, :car_id)
  end
end
