class SessionsController < ApplicationController
  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:positive] = "Welcome #{@user.username} to chatroom application"
      redirect_to root_path
    else
      flash[:negative] = 'Incorrect username or password'
      render :index
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:info] = 'Good bye!'
    redirect_to root_path
  end
end
