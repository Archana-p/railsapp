class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user,:user_signed_in? ,:is_admin?
  
  def user_signed_in?
  	#binding.pry
  	current_user.present?
  end

   def is_admin?
     current_user.present? && current_user.admin_user == true 
     # current_user.is_admin?
      
    
  end

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
