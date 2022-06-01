# frozen_string_literal: true

class ConsumablesController < ApplicationController
  before_action :set_car_consumable_value, only: %i[edit update]

  def index
    @consumables = Consumable.where(car_id: params[:car_id])
    authorize @consumables
  end

  def edit
    authorize @car_consumable_value
  end

  def update
    authorize @car_consumable_value

    if @car_consumable_value.update(car_consumable_value_params)
      redirect_to consumables_path(
        car_id: car_consumable_value_params[:car_id]
      ),
                  notice: 'Car consumable value was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_car_consumable_value
    @car_consumable_value = Consumable.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def car_consumable_value_params
    params.require(:consumable).permit(:value, :car_id)
  end
end
