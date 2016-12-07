class AddSomeColumnsToFormulas < ActiveRecord::Migration[5.0]
  def up
    add_column :formulas, :title, :string
    add_column :formulas, :glicko, :boolean  
    add_column :formulas, :winstreak, :boolean 
    add_column :formulas, :losestreak, :boolean  
    add_column :formulas, :additional_params, :boolean
    add_column :formulas, :win_points, :integer
    add_column :formulas, :lose_points, :integer
    add_column :formulas, :win_streak_boost, :float
    add_column :formulas, :lose_steak_boost, :float
  end
  def down
    remove_column :formulas, :title, :string
    remove_column :formulas, :glicko, :boolean  
    remove_column :formulas, :winstreak, :boolean 
    remove_column :formulas, :losestreak, :boolean  
    remove_column :formulas, :additional_params, :boolean
    remove_column :formulas, :win_points, :integer
    remove_column :formulas, :lose_points, :integer
    remove_column :formulas, :win_streak_boost, :float
    remove_column :formulas, :lose_steak_boost, :float
  end
end
