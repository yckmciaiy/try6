class RemoveReferencesFromFormulas < ActiveRecord::Migration[5.0]
  def change
    remove_reference :formulas, :user_id, index: true
    remove_reference :formulas, :user, index: true
  end
end
