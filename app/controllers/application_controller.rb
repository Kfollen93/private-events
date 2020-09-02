class ApplicationController < ActionController::Base
    
    def user_signed_in?
        current_user.present?
    end
    
    def sign_in(user)
        session[:user_id] = user.id 
    end

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
    helper_method :current_user
end
