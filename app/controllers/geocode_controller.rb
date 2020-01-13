class GeocodeController < ApplicationController
  def index
    render json: GeocodeService.call(point: params[:point])
  rescue StandardError => e
    render json: {
      error: e.to_s
    }, status: 422
  end
end
