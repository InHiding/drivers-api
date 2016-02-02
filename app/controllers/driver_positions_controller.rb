class DriverPositionsController < ApplicationController
  def index
    driver_position = DriverPosition.find_by_driver_id(params[:driver_id])
    if driver_position
      render json: driver_position
    else 
      head :not_found
    end
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
    unless params[:sw] && params[:ne]
      render json: I18n.t('invalid_area'), status: :bad_request
      return
    end

    positions = DriverPosition.in_area(driver_position_filters).recent

    if params[:available] && params[:available].downcase == 'true'
      positions = positions.available
    end

    render json: positions
  end

  protected

  def driver_position_params
    params.require(:driver_position).permit(:latitude, :longitude, :driver_available)
  end

  def driver_position_filters
    params.permit(:sw, :ne, :available)
  end
end
