class SessionController < ApplicationController
    def new

    end

    def create
        user = User.find_by_username(params[:username])

        if user && user.authenticate(params[:password])
            session[:user_id] = user.id

            flash[:success] = "Welcome back!"
            redirect_to root_path
        else
            flash[:error] = "There is something wrong with your username/password."
            redirect_to login_path
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:success] = "You has logout successfully!"
        redirect_to root_path
    end
end