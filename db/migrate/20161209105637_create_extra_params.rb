class CreateExtraParams < ActiveRecord::Migration[5.0]
  def change
    create_table :extra_params do |t|
      t.string :title
      t.integer :weight
      t.references :formula, foreign_key: true

      t.timestamps
    end
  end
end
