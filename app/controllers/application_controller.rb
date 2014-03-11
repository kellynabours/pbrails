
class ApplicationController < ActionController::Base

  include GoogleHelper
  protect_from_forgery
  before_filter :authenticate , :except => [:login,:create]

  private
    def authenticate  
      if !session[:user_id] 
        #redirect_to :controller=>"user", :action=>"login" 
	redirect_to google_login_url.to_s
        return
      end
      @user = nil
      @user = User.find_by_id(session[:user_id])
      if !@user.nil? then return end
      # session user_id was bad?  redirect to login anyway
      #redirect_to  :controller=>"user", :action=>"login"  
      redirect_to google_login_url.to_s
  end

  
end
