class UsersController < ApplicationController
    before_action :signed_in_user, only: [:show, :update]

    def show
      @list=Car.where(user: current_user)
  	end

  	def new
  		@user = User.new
  	end

  	def create
    	@user = User.new(user_params)
    	if @user.save
    		sign_in @user
      		redirect_to @user
      	else
      		render 'new'
    	end
  	end

    def update
      if @user.update_attributes(user_params)
        redirect_to @user
      else
        @user=current_user
        render 'show'
      end
    end


  	private
      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end

      def signed_in_user
        @user = User.find(params[:id])
        redirect_to root_url unless signed_in? &&  current_user?(@user)
      end
end
