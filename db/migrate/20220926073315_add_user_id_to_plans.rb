class AddUserIdToPlans < ActiveRecord::Migration[6.1]
  def change
    add_column :plans, :user_id, :integer, null: false, foreign_key: true
  end
end
