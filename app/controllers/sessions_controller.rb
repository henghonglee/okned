class SessionsController <  Devise::SessionsController
  def create
      puts warden.authenticate!
      resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
      current_user.reset_authentication_token!
      return sign_in_and_redirect(resource_name, resource)
    end


    def sign_in_and_redirect(resource_or_scope, resource=nil)
      scope = Devise::Mapping.find_scope!(resource_or_scope)
      resource ||= resource_or_scope
      sign_in(scope, resource) unless warden.user(scope) == resource
      return render :json => {
                                :success => true, 
                                :auth_token => current_user.authentication_token, 
                                :user => resource,
                                :redirect => stored_location_for(scope) || after_sign_in_path_for(resource)
                              }
    end

    def failure
      puts devise_error_messages
      return render:json => {:status => 401, :success => false, :errors => ["Login failed."]}
    end
    
    def destroy
      current_user.authentication_token = nil
      super
      
    end
    
end
