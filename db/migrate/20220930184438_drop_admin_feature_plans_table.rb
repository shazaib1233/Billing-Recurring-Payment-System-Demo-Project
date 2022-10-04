class DropAdminFeaturePlansTable < ActiveRecord::Migration[6.1]
  def change
        drop_table :admin_feature_plans
  end
end
