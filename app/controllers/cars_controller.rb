class CarsController < ApplicationController
	def info
  	end

  	def search
  	end

	def makes
  		@makes=Make.all
  		render json: @makes
  	end

  	def model
  		@models=Model.where(make_id: params[:id])
  		render json: @models
  	end

  	def ftypes
  		@fuel_types=FuelType.all
  		render json: @fuel_types
  	end
end
