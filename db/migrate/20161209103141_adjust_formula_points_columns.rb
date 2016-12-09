class AdjustFormulaPointsColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :formulas, :win_points
    remove_column :formulas, :lose_points
    add_column :formulas, :extra_points, :integer
  end
end
