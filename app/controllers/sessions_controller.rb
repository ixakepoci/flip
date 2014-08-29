class SessionsController < ApplicationController
before_filter :disable_nav
	def show
    
	end
	def create

		if params[:password]
			user = User.authenticate(params[:email], params[:password])
			if user
    			session[:user_id] = user.id
    			redirect_to dashboard_url
  			else
    			flash.now.alert = "Invalid email or password"
    			render "new"
  			end
  		else
  			auth = request.env["omniauth.auth"]
  			user = User.find_by_provider_and_uid(auth["provider"],auth["uid"])||User.create_with_omniauth(auth)
  			session[:user_id] = user.id
  			redirect_to dashboard_url
  		end
  	end

  	def destroy
		session[:user_id] = nil
		redirect_to root_url, :notice => "Signed out!"
	end
	
	def new
	end
end
