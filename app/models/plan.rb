class Plan < ApplicationRecord
  belongs_to :user

  has_many :features, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :users, through: :subscriptions

  accepts_nested_attributes_for :features, reject_if: :all_blank, allow_destroy: true
end
