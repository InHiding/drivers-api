class DriversController < ApplicationController
  def index
    drivers = Driver.all

    render json: drivers
  end

  def show
  end

  def create
  end
end
