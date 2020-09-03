class SessionsController < ApplicationController
    def new
    end
    
    def create
        @user = User.find_by(username: params[:username])
        if @user
            session[:user_id] = user.id
            redirect_to @user, :notice => 'Logged in successfully'
        else
            flash.now[:alert] = "Invalid login"
            render :action => 'new'
        end
    end
    
    def destroy
        session.clear
        redirect_to root_path, :notice => 'You logged out successfully'
    end
end