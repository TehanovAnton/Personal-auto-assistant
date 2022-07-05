# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit update destroy]

  def index
    @orders = Order.where(car_id: params[:car_id]).page params[:page]
  end

  def show
    @comments = @order.comments.page(params[:page])
  end

  def new
    @order = Order.new
    @service = Service.find_by(id: params[:service_id])
    @work = Work.find_by(id: params[:work_id])
    @price = OrganizationsWork.find_by(organization_id: @service.organization.id,
                                       work_id: @work.id).id
    @cars = Car.where(user_id: current_user.id)
  end

  def create
    service = OrderService.new(service_id: order_params[:service_id],
                               work_id: order_params[:work_id],
                               car_id: order_params[:car_id])
    if service.new_order.save
      service.mail_notifications(Order.last)
      redirect_to orders_path(car_id: service.car.id), notice: 'Order was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:service_id, :work_id, :car_id)
  end
end
