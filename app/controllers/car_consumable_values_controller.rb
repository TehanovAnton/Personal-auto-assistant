class CarConsumableValuesController < ApplicationController
  before_action :set_car_consumable_value, only: %i[ show edit update destroy ]

  # GET /car_consumable_values or /car_consumable_values.json
  def index
    @car_consumable_values = CarConsumableValue.all
  end

  # GET /car_consumable_values/1 or /car_consumable_values/1.json
  def show
  end

  # GET /car_consumable_values/new
  def new
    @car_consumable_value = CarConsumableValue.new
  end

  # GET /car_consumable_values/1/edit
  def edit
  end

  # POST /car_consumable_values or /car_consumable_values.json
  def create
    @car_consumable_value = CarConsumableValue.new(car_consumable_value_params)

    respond_to do |format|
      if @car_consumable_value.save
        format.html { redirect_to @car_consumable_value, notice: "Car consumable value was successfully created." }
        format.json { render :show, status: :created, location: @car_consumable_value }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @car_consumable_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /car_consumable_values/1 or /car_consumable_values/1.json
  def update
    respond_to do |format|
      if @car_consumable_value.update(car_consumable_value_params)
        format.html { redirect_to @car_consumable_value, notice: "Car consumable value was successfully updated." }
        format.json { render :show, status: :ok, location: @car_consumable_value }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @car_consumable_value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /car_consumable_values/1 or /car_consumable_values/1.json
  def destroy
    @car_consumable_value.destroy
    respond_to do |format|
      format.html { redirect_to car_consumable_values_url, notice: "Car consumable value was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car_consumable_value
      @car_consumable_value = CarConsumableValue.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def car_consumable_value_params
      params.require(:car_consumable_value).permit(:value)
    end
end
