class CreateSubscriptionFeatures < ActiveRecord::Migration[6.1]
  def change
    create_table :subscription_features do |t|
      t.references :feature, null: false, foreign_key: true
      t.references :subscription, null: false, foreign_key: true
      t.integer :consumed_units

      t.timestamps
    end
  end
end
