class CommentsController < ApplicationController
	before_action :signed_in_user, only: [:create]

	def create
		@car=Car.find(params[:comment][:car_id])
		@comment = Comment.new(comment_params)
		@comment.user=current_user
		@comment.save
  		redirect_to @car
	end

  	private
    	def comment_params
        	params.require(:comment).permit(:car_id, :value)
      	end

      	def signed_in_user
	        redirect_to root_url unless signed_in?
      	end
end
