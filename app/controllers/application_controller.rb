class ApplicationController < ActionController::Base
	protect_from_forgery
  	helper_method :current_user
  	require 'will_paginate/array'
    

  	def show
  	end
def disable_nav
  @disable_nav = true
end
protected
def authenticate_user
if session[:user_id]
# set current user object to @current_user object variable
@current_user = User.find session[:user_id]
return true	
else
redirect_to(:controller => 'sessions', :action => 'show')
flash.now[:notice] = "You must be logged in"
return false
end
end
  	private

  	def current_user
  		@current_user ||= User.find(session[:user_id]) if session[:user_id]
  	end
end
