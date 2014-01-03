class CarController < ApplicationController
  def info
  end

  def search
  end

  def make
  	@makes=Make.all
  	render json: @makes
  end

  def model
  	@models=Model.where(make_id: params[:id])
  	render json: @models
  end
end
