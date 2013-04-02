# class RegistrationsController < Devise::RegistrationsController
# 
# def new
# render :text => "no sign up page"
#   
# end
#   def create
#     build_resource
#       resource.admin_id = params[:user][:admin_id]
#         if resource.save
#           if resource.active_for_authentication?
#             set_flash_message :notice, :signed_up if is_navigational_format?
#             sign_in(resource_name, resource)
#             current_user.reset_authentication_token!
#             render :json =>{:success => true , :auth_token => current_user.authentication_token}
#             
#           else
#             set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
#             expire_session_data_after_sign_in!
#             respond_with resource, :location => after_inactive_sign_up_path_for(resource)
#           end
#         else
#           clean_up_passwords resource
#             render :json => {:success => false, :status => 403, :error => resource.errors}
#         end
#   end
# 
# end
