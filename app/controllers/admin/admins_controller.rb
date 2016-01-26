class Admin::AdminsController < Admin::BaseController
  before_action :authenticate_admin!

  def edit
  end

  def update
    if @current_admin.update(admin_params)
      redirect_to edit_admin_admin_path(@current_admin), notice: 'Admin was successfully updated.'
    else
      render :edit
    end
  end

  private

    def admin_params
      params.require(:admin).permit(:email, :password, :password_confirmation)
    end
end
