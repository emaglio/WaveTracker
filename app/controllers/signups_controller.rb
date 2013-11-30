class SignupsController < ApplicationController

	def new
	end

	def create
		@user = User.new
		@user.update_attribute(:email, params[:signup][:email])
		@user.update_attribute(:password, params[:signup][:password])
		@user.update_attribute(:password_confirm, params[:signup][:password_confirm])
		@user.update_attribute(:agree, params[:signup][:agree])

		redirect_to :controller => "users", :action =>"create", :id => @user.id
	end

	def destroy
	end

end