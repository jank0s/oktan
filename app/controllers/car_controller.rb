class CarController < ApplicationController
  def info
  end

  def search
  end

  def make
  	@makes=Make.all
  	render json: @makes
  end
end
