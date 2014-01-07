class SignupsController < ApplicationController

	def new

	end

	def create
		@user = User.new

		@user.email = params[:signup][:email]
		@user.password = params[:signup][:password]
		@user.password_confirm = params[:signup][:password_confirm]
		@user.agree = params[:signup][:agree]


		redirect_to :controller => "users", :action =>"create", :method =>"post", :id => @user.id, :user => params[:signup]
	end

	def destroy
	end

end