# frozen_string_literal: true

class AreasController < ApplicationController
  def index
    render json: AreaSource.source
  end
end
