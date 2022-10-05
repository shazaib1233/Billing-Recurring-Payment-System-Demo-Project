class Payment < ApplicationRecord
  belongs_to :user

  def self.calculate_total(user_id)
    total = 0
    user_plans = User.find(user_id).plans.pluck(:plan_id).uniq
    user_plans.each do |plan|
      plan = Plan.find(plan)
      total += plan.monthly_fee
      plan.features.each do |feature|
        consumed = Subscription.where(user_id: user_id).where(plan_id: plan).where(feature_id: feature.id).first.consumed_units
        allocated = FeaturePlan.where(plan_id: plan).where(feature_id: feature.id).first.allocated_units
        difference = consumed - allocated
        if difference > 0
          total += difference * Feature.find(feature.id).unit_price
        end
      end
    end

    total
  end

end
