class Product < ApplicationRecord

  validates :name, presence: true, uniqueness: true 
  validates :price, numericality: {greater_than: 0}
  validates :description, length: {in: 20..500}

  def supplier
    Supplier.find_by(id: supplier_id)
  end

  def images
    Image.where(id: image_id)
  end

  def is_discounted?
    if price < 10
      "true"
    else
      "false" 
    end   
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

end
