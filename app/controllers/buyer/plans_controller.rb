class Buyer::PlansController < Buyer::BaseController
  before_action :set_plan, only: %i[ show edit update destroy ]

  def index
    @plans = Plan.all
    @subscriptions = Subscription.where(user_id: current_user.id)
    @bill = Payment.where(user_id: current_user.id).last
  end

  def show; end

  private

  def set_plan
    @plan = Plan.find(params[:id])
  end

  def plan_params
    params.require(:plan).permit(:name, :monthly_fee, features_attributes: [:id, :name, :code, :unit_price, :max_unit_limit, :_destroy])
  end

end
