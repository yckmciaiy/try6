class AddFormulaToAdditionalParam < ActiveRecord::Migration[5.0]
  def change
    add_reference :additional_params, :formula, foreign_key: true
  end
end
