class ApplicationController < ActionController::Base
    def validate_login
        @current_user = User.where(id: session[:user_id]).first
        redirect_to login_path unless @current_user.present?
    end
end
