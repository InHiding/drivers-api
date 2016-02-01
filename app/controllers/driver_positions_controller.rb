class DriverPositionsController < ApplicationController
  def index
  end

  def create
    position_params = driver_position_params.merge(driver_id: params[:driver_id])   
    position = DriverPosition.new(position_params)
 
    if position.save
      head :no_content, location: driver_status_index_url
    else
      render json: position.errors, status: :unprocessable_entity      
    end
  end

  def search
  end

  protected

  def driver_position_params
    params.require(:driver_position).permit(:latitude, :longitude, :driver_available)
  end

  def driver_position_filters
    params.permit(:sw, :ne, :available)
  end
end
