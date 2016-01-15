class DriversController < ApplicationController
  def index
    drivers = Driver.all

    if filters = driver_filters
      drivers = Driver.where(filters)
    end

    render json: drivers
  end

  def show
    driver = Driver.find(params[:id])
    render json: driver
  end

  def create
  end

  private

  def driver_params
    params.require(:driver).permit(:name, :car_plate)
  end

  def driver_filters
    params.permit(:name, :car_plate)
  end
end
