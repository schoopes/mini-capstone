class RemoveImageUrlFromProducts < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :image_url, :url
  end
end
