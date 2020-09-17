class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def index
        # current_user = User.find_by_id(session[:current_user_id])
        @users = User.all
    end

    def create
        @user = User.new(user_params)

        if @user.save
            flash[:notice] = "You signed up successfully"
            session[:user_id] = @user.id
            redirect_to @user
        else
            render :new
        end
    end

    def events
        @user = User.find(params[:id])
        @events = @user.events
    end

    def show
        @user = User.find(params[:id])
        # @users = User.all
        # @user_attendings = User.find(params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:username)
    end
end
