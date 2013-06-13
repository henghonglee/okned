class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :redirect_if_old
  protected

    def redirect_if_old
      if request.host == 'tastebuds-dev.herokuapp.com'
        redirect_to "http://54.251.168.255#{request.request_uri}", :status => :moved_permanently 
      end
    end
end
