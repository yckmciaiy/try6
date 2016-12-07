class RemoveFomulaIdFromAdditionalParams < ActiveRecord::Migration[5.0]
  def change
    remove_column :additional_params, :formula_id, :integer
  end
end
