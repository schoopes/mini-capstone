class GiveDefaultValueToInStockInProducts < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :in_stock, :boolean, default: true
  end
end
