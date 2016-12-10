class CreateAccessKeys < ActiveRecord::Migration[5.0]
  def change
    create_table :access_keys do |t|
      t.string :secret
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
