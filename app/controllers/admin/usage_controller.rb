class Admin::UsageController < Admin::BaseController

  def index
    @users = User.joins(:subscriptions).distinct
  end

  def show
    @user = User.find(params[:id])
    @subscriptions = @user.subscriptions.pluck(:plan_id).uniq
    @bill = Payment.where(user_id: @user.id).last
  end

end
