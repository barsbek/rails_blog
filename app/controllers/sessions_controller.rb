class SessionsController < ApplicationController
  def log_in
  end

  def authenticate
    user = User.find_by_email(params[:email])

    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user, notice: "Logged In!"
    else
      render "log_in"
    end
  end

  def log_out
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out!"
  end
end
