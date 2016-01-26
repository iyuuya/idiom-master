class Admin::BaseController < ApplicationController
  include Admin::SessionsHelper

  layout 'layouts/admin'

  protected

  def authenticate_admin!
    unless logged_in?
      flash[:error] = 'Please login'
      redirect_to admin_login_path
    end
  end
end
