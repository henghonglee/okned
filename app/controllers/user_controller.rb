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
  
  def update
    if current_user
      current_user.email = params[:email]
      current_user.first_name = params[:first_name]
      if current_user.save
        render :json => {:status=>201 , :success=>false}
      else
        render :json => { :status => 404 , :success => false , :errors => current_user.errors}
      end
    end
  end
end
