class Admin::UsersController < Admin::BaseController

  def index
    @users = User.all
    @plans = Plan.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path, notice: 'User was successfully deleted.'
  end

end
