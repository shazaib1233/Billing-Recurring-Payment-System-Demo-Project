class Plan < ApplicationRecord
  belongs_to :user

  has_many :feature_plans, dependent: :destroy
  has_many :features, through: :feature_plans
  has_many :subscriptions, dependent: :destroy
  has_many :users, through: :subscriptions

  validates :name, :monthly_fee, presence: true
  validates :monthly_fee, numericality: { greater_than: 0 }

  accepts_nested_attributes_for :feature_plans, reject_if: :all_blank, allow_destroy: true
end
