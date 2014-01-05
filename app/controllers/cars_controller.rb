class CarsController < ApplicationController
	def show
		@car=Car.find(params[:id])
		@carID=@car.id
		@isOwner=(current_user==@car.user)
		@carHead=@car.model.make.name+" "+@car.model.name+" ("+@car.year.to_s+")"

		@newComment=Comment.new
		@comments=@car.comments

		@newEntry=Entry.new

		@entries=@car.entries.order(:odo).reverse_order
		if @entries.count>1
			@kmSum=@entries.sum('km')
			@quantitySum=@entries.sum('quantity')
			@priceSum=@entries.sum('price')
			@conMin=@entries.minimum('con')
			@conAvg=@car.con_avg
			@conMax=@entries.maximum('con')
			@costAvg=(@priceSum-@entries.last.price)/@kmSum*100
		else
			@kmSum=@quantitySum=@priceSum=@conMin=@conAvg=@conMax=@costAvg=0
		end

		@tEntries=@car.entries.where("km IS NOT NULL").order(:date)
		@tLabels=@tEntries.pluck(:odo)
		@tValues=@tEntries.pluck(:con)

  	end

  	def search
  		@yFrom=params[:yFrom]
  		@yTo=params[:yTo]
  		@pFrom=params[:pFrom]
  		@pTo=params[:pTo]

  		@cars=Car.joins(:model).where("con_avg IS NOT NULL")
  		if params[:makeID].to_i>0
  			@cars=@cars.where(models: {make_id: params[:makeID]})
  		end
  		if params[:modelID].to_i>0
  			@cars=@cars.where(model_id: params[:modelID])
  		end
  		if params[:fTypeID].to_i>0
  			@cars=@cars.where(fuel_type_id: params[:fTypeID])
  		end
  		if @yFrom.to_i>0
  			@cars=@cars.where("year>=?", @yFrom)
  		end
  		if @yTo.to_i>0
  			@cars=@cars.where("year<=?", @yTo)
  		end
  		if @pFrom.to_i>0
  			@cars=@cars.where("power>=?", @pFrom)
  		end
  		if @pTo.to_i>0
  			@cars=@cars.where("power<=?", @pTo)
  		end


  		@count=@cars.count
  		if @count>0
	  		@conMin=@cars.minimum('con_avg')
	  		@conAvg=@cars.average('con_avg')
	  		@conMax=@cars.maximum('con_avg')
	  	else
	  		@conMin=@conAvg=@conMax=0
	  	end
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
