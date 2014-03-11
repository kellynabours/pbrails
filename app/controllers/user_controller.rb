require 'uri'
require 'net/http'
require 'net/https'
require 'net/ldap'

class UserController < ApplicationController
  def login
#    LDAP login
#    if (!params['email'] || !params['password'])  then 
#	render :layout => false
#	return 
#    end
#    ldap_login(params['email'],params['password'])
#    redirect_to :action=>"index", :controller=>"home"
     redirect_to google_login_url.to_s
  end
  
  def logout
    session[:user_id]=nil
  end

  def create
    user_tokens=google_get_tokens(params[:code])
    user_info=google_call_api('/oauth2/v2/userinfo',user_tokens['access_token'])
    emails=user_info['email'].split("@")
    if (!emails[1] or emails[1]!="viz.com")
      return
    end
    email=emails[0]
    email=email[/\A\w+/].downcase  #throw out the domain, if it was there.
    @user=User.find_or_create_by_name(email)
    @user.google_refresh_token=user_tokens['refresh_token']
    @user.google_access_token=user_tokens['access_token']
    @user.google_expires=user_tokens['expires_in']
    @user.save
    session[:user_id]=@user.id
    redirect_to :action=>"index", :controller=>"home"
  end

  def ldap_login(email, password)
      email = email[/\A\w+/].downcase  # Throw out the domain, if it was there
      ldap = Net::LDAP.new
      ldap.host='dmaster.viz.com'
      ldap.auth "uid="+email+",cn=users,dc=viz,dc=com", password
      if ldap.bind
         @user=User.find_or_create_by_name(email)
         session[:user_id]=@user.id
      else
         # flash mesasge of failure
         return
      end
  end

end
