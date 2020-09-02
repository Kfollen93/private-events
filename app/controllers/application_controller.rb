class ApplicationController < ActionController::Base
    def user_signed_in?
        current_user.present?
    end
    helper_method :user_signed_in?

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
end
