# frozen_string_literal: true

class LocationsController < ApplicationController
  before_action :set_location, only: :show

  def index
    @locations = Location.all

    render json: @locations
  end

  def show
    render json: @location
  end

  def create
    @location = Location.new(location_params)

    if @location.save
      render json: @location.id, status: :created, location: @location
    else
      render json: @location.errors, status: :unprocessable_entity
    end
  end

  private

  def set_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:name)
  end
end
