class DropFormulas < ActiveRecord::Migration[5.0]
  def change
    drop_table :formulas
  end
end
