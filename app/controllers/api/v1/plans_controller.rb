class Api::V1::PlansController < Api::ApiController
  skip_before_action :ensure_token, only: :index

  def index
    success_response(plans: Plan.all)
  end

  def my_plans
    success_response(plans: Plan.all) if current_user.admin?
    success_response(plans: current_user.plans) if current_user.buyer?
  end
end
