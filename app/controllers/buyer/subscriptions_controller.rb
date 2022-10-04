class Buyer::SubscriptionsController < Buyer::BaseController
  before_action :set_subscription, only: %i[ show edit update destroy increment_consumed ]

  def index
    @subscriptions = Subscription.all
  end

  def increment_consumed
    @subscription.update_attribute(:consumed_units, @subscription.consumed_units+1)
    redirect_to root_path, notice: "Unit Consumed"
  end

  def show; end

  def new; end

  def edit; end

  def create
    @subscription = Subscription.new(subscription_params)

    if @subscription.save
      redirect_to buyer_plans_path, notice: 'Subscription was successfully created.'
    else
      redirect_to buyer_plans_path, alert: 'Subscription Failed: ' + @subscription.errors.full_messages.to_sentence
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
    redirect_to buyer_plans_path, notice: 'Plan was successfully unsubscribed.'
  end

  private

  def set_subscription
    @subscription = Subscription.find(params[:id])
  end

  def subscription_params
    params.require(:subscription).permit(:name, :user_id, :plan_id)
  end
end
