class EntriesController < ApplicationController
	def create
		@entry = Entry.new(entry_params)
		@car=Car.find(params[:entry][:car_id])
		if @entry.save
  			redirect_to @car
  		else
  			redirect_to @car
		end
	end

  	private
    	def entry_params
        	params.require(:entry).permit(:car_id, :date, :odo, :quantity, :price)
      	end

      	def owner

      	end
end
