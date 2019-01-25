class ChangeImageIdDataTypeInProducts < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :image_id, "integer USING CAST(image_id AS integer)"
  end
end
