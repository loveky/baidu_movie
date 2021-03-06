class UsersController < ApplicationController
  layout "application_without_sidebar"

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      flash[:success] = "Thanks for your register!"
      redirect_to root_path
    else
      render :new
    end
  end
end