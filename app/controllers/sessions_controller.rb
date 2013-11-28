class SessionsController < ApplicationController

	def new
	end
	
	def create
		@user = User.find_by(email: params[:session][:email].downcase)
		if @user && check_password
			@user.update_attribute(:remember, params[:session][:remember])
			sign_in @user
			flash[:success] = "Welcome to the WaveTracker team!"
			redirect_to @user
		else
			flash.now[:error] = 'Invalid email/password combination' #do better
			render 'new'
		end
	end
	
	def destroy
		@user = current_user
		sign_out @user
		redirect_to welcomes_path, alert: "Sign out done!"
	end
	
	def check_password
		if (params[:session][:password] == @user.password)
			return true
		else
			return false
		end
	end
	
	
end