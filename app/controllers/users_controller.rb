class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		@book = Book.new
		@books = @user.books
	end

	def index
		@user = current_user
		@book = Book.new
		@users = User.all
	end

	def edit
		@user = User.find(params[:id])
		if @user.id != current_user.id
		   redirect_to user_path(current_user)
		end
	end

	def update
  	    @user = User.find(params[:id])
  	    if @user.update(user_params)
  	    redirect_to user_path(params[:id]), notice: 'You have updated user successfully.'
  	    else
  	    	flash[:alert] = 'error'
  	    	render :edit
  	    end
    end

	private
	def user_params
		params.require(:user).permit(:name, :introduction, :profile_image)
	end

end