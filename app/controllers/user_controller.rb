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
  
end
