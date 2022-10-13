class Api::V1::SubscriptionsController < Api::ApiController
  def create
    @subscription = current_user.subscriptions.new(plan_id: params[:plan_id])
    if @subscription.save
      success_response(subscription: { id: @subscription.id, name: @subscription.name, user_id: @subscription.user_id, plan_id: @subscription.plan_id })
    else
      failure_response(400, subscription: @subscription.errors)
    end
  end

  def destroy
    @subscription = current_user.subscriptions.find_by_plan_id(params[:plan_id])
    if @subscription.blank?
      failure_response(401, subscription: "#{ current_user.email} is not subscribed to plan with id: #{params[:plan_id] }")
    else
      @subscription.destroy
      success_response(message: "#{current_user.email} has successfully unsubscribed the plan with id: #{params[:plan_id]}")
    end
  end
end
