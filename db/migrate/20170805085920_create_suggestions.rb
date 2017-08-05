class CreateSuggestions < ActiveRecord::Migration[5.0]
  def change
    create_table :suggestions do |t|
      t.references :user
      t.references :bicycle
      t.string :name
      t.text :description
      t.timestamps
    end
  end
end
