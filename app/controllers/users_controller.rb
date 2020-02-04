class UsersController < ApplicationController

	def new
		@user = User.new
	end
	
	def create
		# @user = User.new(username: params[:username], email: params[:email], password: params[:password])
		@user = User.new(user_params)
		if @user.save
				redirect_to new_user_path, flash: {success: 'User created!'}
		else
			redirect_to new_user_path, flash: {danger: 'User not created!'}
		end
	end

	def user_params
		params.require(:user).permit(:username,:email,:password)
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			redirect_to edit_user_path(@user), flash: {success: 'User updated!'}
		else
			redirect_to edit_user_path(@user), flash: {danger: 'User update failed!'}
		end
	end
end
