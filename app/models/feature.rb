class Feature < ApplicationRecord
  has_many :feature_plans, dependent: :destroy
  has_many :plans, through: :feature_plans
  has_many :subscription_features, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :code }
  validates :code, :unit_price, :max_unit_limit, presence: true
  validates :unit_price, :max_unit_limit, numericality: { greater_than: 0 }

end
