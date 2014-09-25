class UsersController < ApplicationController
  before_filter :check_for_sign_up , only: [:new ,:create]
	def index
		@users = User.all
	end
 def new
   @user = User.new
	end 

	def create
		
    @user = User.new(params[:user])
	  @user.admin_user = false 
	   if @user.save 
	   	
	    redirect_to users_path , :notice => "signed up "
	   else
	   	 render('new')
	   	end
	 
	end 

	def check_for_sign_up
		redirect_to root_url if user_signed_in?
	end
end
