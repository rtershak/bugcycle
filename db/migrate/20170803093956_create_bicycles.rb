class CreateBicycles < ActiveRecord::Migration[5.0]
  def change
    create_table :bicycles do |t|
      t.string :name
      t.text :description
      t.references :category, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
