class DefaultValueConsumedUnits < ActiveRecord::Migration[6.1]
  def change
    change_column :subscription_features, :consumed_units, :integer, default: 0
  end
end
