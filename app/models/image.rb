class Image < ApplicationRecord
  def product
    Product.find_by(image_id: id)
  end
end
