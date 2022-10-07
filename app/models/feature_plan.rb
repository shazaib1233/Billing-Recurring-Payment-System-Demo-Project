class FeaturePlan < ApplicationRecord
  belongs_to :plan
  belongs_to :feature

  validates :feature_id, uniqueness: { scope: :plan_id }
  validates :allocated_units, presence: true
  validates :allocated_units, numericality: { greater_than: 0 }

  validate :allocated_units_limit

  def allocated_units_limit
    return if allocated_units.blank?
    return if allocated_units < feature.max_unit_limit

    errors.add(:allocated_units, "should be less than #{feature.max_unit_limit}(max unit limit) for #{feature.name} feature")
  end
end
