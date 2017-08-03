class AddImageToBicycle < ActiveRecord::Migration[5.0]
  def change
    add_column :bicycles, :image, :string
  end
end
