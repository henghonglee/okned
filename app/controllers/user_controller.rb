class UserController < ApplicationController
  
  def create
    if not current_user
      u = User.create(:email => "guest_#{Time.now.to_i}#{rand(99)}@example.com")
      if u.save(:validate => false)
        u.reset_authentication_token!
        render :json => {:auth_token => u.authentication_token , :status => 201 , :success => true, :user=> u}
      else
        render :json => { :status => 404 , :success => false}
      end
    else
      render :json => {:auth_token => u.authentication_token , :status => 201 , :success => true, :user=> u}
    end
  end
  
  
  def get_user_ratings
    if current_user
      render :json => {:status => 201 , :success=>true , :ratings => current_user.ratings }
    else
      render :json => { :status => 401 , :success => false}
    end
  end
  
  def email_has_account
    @user = User.find_by_email(params[:email])
    
    if @user
      render :json => {:status => 201 , :success=>true , :user => @user , :auth_token => @user.authentication_token}
    else
      render :json => { :status => 401 , :success => false}
    end
  end
  def check_user_authentication_status
    if current_user
      if current_user.encrypted_password.length > 0
        render :json => {:status => 201 , :success=>true }
      else
        render :json => { :status => 401 , :success => false}
      end
    end
  end
  
  def update_user
    if current_user
      current_user.email = params[:email]
      current_user.password = params[:password]
      if current_user.save
        render :json => {:status=>201 , :success=>true}
      else
        render :json => { :status => 404 , :success => false , :errors => current_user.errors}
      end
    end
  end
end
