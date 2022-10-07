class RemoveFeatureFromSubscriptions < ActiveRecord::Migration[6.1]
  def change
    remove_reference :subscriptions, :feature, null: false, foreign_key: true
    remove_column :subscriptions, :consumed_units
  end
end
