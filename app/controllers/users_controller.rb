class UsersController < ApplicationController
  before_action :logged_in_redirect, only: [:new]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
      flash[:positive] = "Welcome #{@user.username} to chatroom application"
    else
      render :new
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
