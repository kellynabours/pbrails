require 'net/ldap'

class UserController < ApplicationController
  def login
    if (!params['email'] || !params['password'])  then 
	render :layout => false
	return 
    end
    ldap_login(params['email'],params['password'])
    redirect_to :action=>"index", :controller=>"home"
  end
  
  def logout
    session[:user_id]=nil
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
