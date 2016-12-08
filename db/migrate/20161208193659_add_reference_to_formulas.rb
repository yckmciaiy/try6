class AddReferenceToFormulas < ActiveRecord::Migration[5.0]
  def change
    add_reference :formulas, :user, index: true
  end
end
