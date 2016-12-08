class CreateFormulas < ActiveRecord::Migration[5.0]
  def change
    create_table :formulas do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.integer :win_points
      t.integer :lose_points
      t.boolean :glicko
      t.boolean :winstreak
      t.boolean :losestreak
      t.float :winstreak_boost
      t.float :losestreak_boost
      t.boolean :extra_params

      t.timestamps
    end
  end
end
