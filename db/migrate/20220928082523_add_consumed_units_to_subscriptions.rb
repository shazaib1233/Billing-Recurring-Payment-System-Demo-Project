class AddConsumedUnitsToSubscriptions < ActiveRecord::Migration[6.1]
  def change
    add_column :subscriptions, :consumed_units, :integer, default: 0
  end
end
