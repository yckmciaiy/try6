class AddTitleAndWeigthToAdditionalParams < ActiveRecord::Migration[5.0]
  def change
    add_column :additional_params, :title, :string
    add_column :additional_params, :weight, :integer
  end
end
