class Buyer::SubscriptionsController < ApplicationController
  before_action :set_subscription, only: %i[ show edit update destroy ]

  def index
    @subscriptions = Subscription.all
  end

  def show; end

  def new; end

  def edit; end

  def create
    @subscription = Subscription.new(subscription_params)

    if @subscription.save
      redirect_to buyer_users_path, notice: 'Subscription was successfully created.'
    else
      redirect_to buyer_users_path, alert: 'Subscription Failed: ' + @subscription.errors.full_messages[0].to_s
    end
  end

  def update
    if @subscription.update(subscription_params)
      redirect_to subscription_url(@subscription), notice: 'Subscription was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @subscription.destroy
    redirect_to buyer_users_path, notice: 'Plan was successfully unsubscribed.'
  end

  private

  def set_subscription
    @subscription = Subscription.find(params[:id])
  end

  def subscription_params
    params.require(:subscription).permit(:name, :user_id, :plan_id)
  end
end
