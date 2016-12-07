class AddFormulaIdToFormulas < ActiveRecord::Migration[5.0]
  def change
    add_column :formulas, :formula_id, :integer
  end
end
