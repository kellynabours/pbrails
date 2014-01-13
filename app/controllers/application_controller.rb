class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate , :except => :login

  private
    def authenticate  
      if !session[:user_id] 
        redirect_to :controller=>"user", :action=>"login" 
        return
      end
      @user = nil
      @user = User.find_by_id(session[:user_id])
      if !@user.nil? then return end
      # session user_id was bad?  redirect to login anyway
	# validate google?
      redirect_to  :controller=>"user", :action=>"login"  
  end
end
