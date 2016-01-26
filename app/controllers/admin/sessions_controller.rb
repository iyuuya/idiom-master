class Admin::SessionsController < Admin::BaseController
  include Admin::SessionsHelper

  layout 'layouts/admin_login'

  def new
  end

  def create
    admin = Admin.find_by(email: params[:admin][:email].downcase)
    if admin && admin.authenticate(params[:admin][:password])
      log_in admin
      params[:admin][:remember_me] == '1' ? remember(admin) : forget(admin)
      flash[:success] = 'Successfull logged in!'
      redirect_to admin_dashboard_path
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
