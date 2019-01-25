class Product < ApplicationRecord

  belongs_to :supplier

  validates :name, presence: true, uniqueness: true 
  validates :price, numericality: {greater_than: 0}
  validates :description, length: {in: 20..500}

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
