class UsersController < ApplicationController
  before_filter :disable_nav
	def new
  		@user = User.new
	end

	def create
  		@user = User.new(params[:user])
  		if @user.save
  			session[:user_id] = @user.id
    		redirect_to dashboard_url, :notice => "Signed up!"
  		else
    		render "new"
  		end
	end

	def show
		 
	end
end
