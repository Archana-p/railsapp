class SessionsController < ApplicationController
  before_filter :check_for_login , only: [:new ,:create]
	def new

	end

	def create
		 user = User.authenticate(params[:email], params[:password])
  	if user
	    session[:user_id] = user.id
	    redirect_to root_url, :notice => "Logged in!"
  	else
	    flash.now.alert = "Invalid email or password"
	    render "new"
  	end
	end

	def destroy
	  session[:user_id] = nil
	  redirect_to root_url, :notice => "Logged out!"
  end
  
  def check_for_login
		redirect_to root_url if user_signed_in?
	end
end
