class CreateFeaturePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :feature_plans do |t|
      t.references :plan, null: false, foreign_key: true
      t.references :feature, null: false, foreign_key: true
      t.integer :allocated_units

      t.timestamps
    end
  end
end
