class CreateAdditionalParams < ActiveRecord::Migration[5.0]
  def change
    create_table :additional_params do |t|
      t.integer :formula_id

      t.timestamps
    end
  end
end
