class RenameExtraParamsColumnInFormulas < ActiveRecord::Migration[5.0]
  def change
    rename_column :formulas, :extra_params, :use_extra_params
  end
end
