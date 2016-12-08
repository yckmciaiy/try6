class RemoveReferenceFromFormulas < ActiveRecord::Migration[5.0]
  def change
    remove_reference :formulas, :user_id
  end
end
