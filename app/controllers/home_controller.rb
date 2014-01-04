class HomeController < ApplicationController
	def index
		@top=Car.where("con_avg IS NOT NULL").order(:con_avg).take(10)
		@list=Car.where(user: current_user)
	end
end
