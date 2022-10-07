class Admin::UsageController < Admin::BaseController

  def index
    @users = User.joins(:subscriptions).distinct.includes(:subscriptions)
  end

  def show
    @user = User.find(params[:id])
    @subscriptions = @user.subscriptions.includes(:subscription_features, :plan, feature_plans: [:feature])
  end

end
