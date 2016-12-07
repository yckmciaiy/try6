class RemoveUserIdFromFormulas < ActiveRecord::Migration[5.0]
  def change
    remove_column :formulas, :user_id, :integer
  end
end
