class CarsController < ApplicationController
	def show
		@car=Car.find(params[:id])
		@carID=@car.id
		@isOwner=(current_user==@car.user)
		@carHead=@car.model.make.name+" "+@car.model.name+" ("+@car.year.to_s+")"
		@newEntry=Entry.new
  	end

  	def search
  	end

  	def create
  		@car = Car.new(car_params)
  		@car.user=current_user
  		if @car.save
  			redirect_to @car
  		else
  			redirect_to current_user
  		end
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

  	private
    	def car_params
        	params.require(:car).permit(:model_id, :year, :power, :fuel_type_id)
      	end
end
