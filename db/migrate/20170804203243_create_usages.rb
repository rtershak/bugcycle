class CreateUsages < ActiveRecord::Migration[5.0]
  def change
    create_table :usages do |t|
      t.references :user
      t.integer :bicycle_id
      t.timestamps
    end
  end
end
