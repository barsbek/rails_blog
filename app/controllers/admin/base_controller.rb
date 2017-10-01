class Admin::BaseController < ApplicationController
  before_action :require_login, except: [:log_in, :authenticate]
  helper_method :admin_user  
  layout :admin

  def index
  end

  def log_in
  end

  def authenticate
    admin = Admin.find_by_login(params[:login])
    if admin && admin.authenticate(params[:password])
      session[:admin_id] = admin.id
      redirect_to admin_root_path
    else
      redirect_to admin_log_in_path
    end
  end

  def log_out
    session[:admin_id] = nil
    redirect_to admin_log_in_path
  end

  def admin_user
    Admin.find(session[:admin_id]) if session[:admin_id]
  end

  private
    def require_login
      redirect_to admin_log_in_path unless admin_user
    end
end
