class DropAdditionalParams < ActiveRecord::Migration[5.0]
  def change
    drop_table :additional_params
  end
end
