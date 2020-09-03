    class ApplicationController < ActionController::Base
        before_action :user_signed_in?
    def logged_in?
        deny_access unless user_signed_in?
    end

    def deny_access
        redirect_to root_path, :notice => "Please sign in first."
    end

    def user_signed_in?
        current_user.present?
    end
    helper_method :user_signed_in?
    
    def sign_in(user)
        session[:user_id] = user.id 
    end

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
    helper_method :current_user
    
end
