class Plan < ApplicationRecord
  has_many :features, inverse_of: :plan, dependent: :destroy
  has_many :subscriptions
  has_many :users, through: :subscriptions
  belongs_to :user

  accepts_nested_attributes_for :features, reject_if: :all_blank, allow_destroy: true
end
