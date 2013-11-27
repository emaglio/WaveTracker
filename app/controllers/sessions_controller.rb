class SessionsController < ApplicationController

	def new
	end
	
	def create
		@user = User.find_by(email: params[:session][:email].downcase)
		if @user && check_password == true
			# login_in @user
			redirect_to @user
		else
			flash.now[:error] = 'Invalid email/password combination' #do better
			render 'new'
		end
	end
	
	def destroy
	end
	
	def check_password
		if (params[:session][:password] == @user.password)
			return true
		else
			return false
		end
	end
	
	
end