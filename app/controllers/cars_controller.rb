# frozen_string_literal: true

class CarsController < ApplicationController
  before_action :set_car, only: %i[show edit update destroy parts new_part add_part]
  before_action :fuel_types, :transmission_types, :documents, only: %i[new edit]

  def index
    @cars = Car.all.page params[:page]
    authorize @cars
  end

  def show
    authorize @car
  end

  def new
    pexels_service = PexelsService.new('bmw auto', size: :medium, orientation: :square)
    @photos = []
    3.times do |i| 
      photo = pexels_service.photos[i].src['original']
      @photos.push(photo)
    end

    car = FactoryBot.build(:car)
    @car_form = CarForm.new(car: car)
    authorize car
  end

  def edit
    @car_form = CarForm.new(car: @car)
    authorize @car
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      attach_photo(params[:photo])
      redirect_to @car, notice: 'Car was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    authorize @car
    if @car.update(car_params)
      redirect_to @car, notice: 'Car was successfully updated.'
    else
      redirect_to :edit_car, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @car
    @car.delete
    redirect_to cars_url, notice: 'Car was successfully destroyed.'
  end

  def parts; end

  def new_part
    @parts = Part.select { |part| part unless @car.parts.include?(part) }
  end

  def add_part
    @car.parts << new_car_parts
  end

  private

  def attach_photo(photo_src)
    pexels_service = PexelsService.new

    pexels_service.upload(photo_src)

    photo_name = pexels_service.photo_name_by_src(photo_src)
    photo_path = pexels_service.photo_path_by_src(photo_src)
    photo_file = File.open(photo_path)

    @car.photo.attach(io: photo_file, filename: photo_name)
  end

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car_form).permit(:model, :year_production, :engine_volume, :mileage, :body_type, :fuel_type,
                                     :transmission_type, :maker, :vin, :user_id,
                                     :photo)
  end

  def new_car_parts
    parts_params = params.require(:car).permit(parts: [])
    new_parts_ids = parts_params.to_h[:parts].map { |id| id.to_i if id.present? }.uniq
    Part.select { |p| p if @car.parts.exclude?(p) && new_parts_ids.include?(p.id) }
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
end
