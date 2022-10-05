module SubscriptionHelper

  def get_allocated_units(plan, feature)
    FeaturePlan.where(plan_id: plan).where(feature_id: feature).first.allocated_units
  end

  def get_subscription(user, plan, feature)
    Subscription.where(user_id: user).where(plan_id: plan).where(feature_id: feature).first
  end

  def find_plan(plan)
    Plan.find(plan)
  end

  def get_plans(subscription)
    subscription.pluck(:plan_id).uniq
  end

  def get_plans_count(user)
    user.plans.pluck(:plan_id).uniq.count
  end

end
