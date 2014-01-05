class EntriesController < ApplicationController
	before_action :signed_in_user, only: [:create]

	def create
		@entry = Entry.new(entry_params)
		if @entry.save
			if @car.enitres.count>1
				@car.con_avg=@car.updateAvg
				@car.save
			end
  			redirect_to @car
  		else
  			redirect_to @car
		end
	end

  	private
    	def entry_params
        	params.require(:entry).permit(:car_id, :date, :odo, :quantity, :price)
      	end

      	def signed_in_user
	        @car=Car.find(params[:entry][:car_id])
	        redirect_to root_url unless signed_in? &&  current_user?(@car.user)
      	end
end
