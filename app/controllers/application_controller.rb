class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :get_current_user
    
    protected
    
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:account_update, keys: [:username, :bio, :avatar, :avatar_cache])
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    end

    def get_current_user
        @header_user = current_user
    end
end
