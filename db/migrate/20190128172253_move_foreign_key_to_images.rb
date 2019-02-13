class MoveForeignKeyToImages < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :product_id, :integer
  end

  def change
    remove_column :products, :image_id, :integer
  end
end

#DON'T WORRY ABOUT THIS ONE IT LITERALLY DOES NOTHING