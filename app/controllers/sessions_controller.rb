class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])

    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to users_path, notice: "Logged In!"
      #TODO redirect to last url if exists
    else
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to users_path, notice: "Logged out!"
  end
end