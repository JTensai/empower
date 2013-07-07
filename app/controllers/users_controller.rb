class UsersController < ApplicationController

  # before_filter :authorize

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, notice: "User successfully created."
    else
      render "new"
    end
  end
end
