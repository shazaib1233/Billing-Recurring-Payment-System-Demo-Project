class Admin::UsersController < Admin::BaseController

  def index
    @users = User.all
    @plans = Plan.all
  end

end
