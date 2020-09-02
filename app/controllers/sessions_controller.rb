class SessionsController < ApplicationController
    def create
        if user = User.authenticate(params[:username])
            session[:user_id] = user.id
            redirect_to root_path, :notice => 'Logged in successfully'
        else
            flash.now[:alert] = "Invalid login"
            render :action => 'new'
        end
    end
    
    def destroy
        session[:user_id] = nil
        redirect_to root_path
    end
end