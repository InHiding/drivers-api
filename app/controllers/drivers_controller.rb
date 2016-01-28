class DriversController < ApplicationController
  def index
    drivers = Driver.all

    if filters = driver_filters
      drivers = drivers.where(filters)
    end

    render json: drivers
  end

  def show
    driver = Driver.find(params[:id])
    render json: driver
  end

  def create
    driver = Driver.new(driver_params)

    if driver.save
      head :no_content, location: driver 
    else
      render json: driver.errors, status: :unprocessable_entity
    end
  end
  
  private

  def driver_params
    params.require(:driver).permit(:name, :car_plate)
  end

  def driver_filters
    params.permit(:name, :car_plate)
  end
end
