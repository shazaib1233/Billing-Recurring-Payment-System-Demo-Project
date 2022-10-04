class Feature < ApplicationRecord
  has_many :feature_plans, dependent: :destroy
  has_many :plans, through: :feature_plans
end
