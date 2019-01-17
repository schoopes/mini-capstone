class Api::ProductsController < ApplicationController
  def show_products
    @products = Product.all
    render 'show_products.json.jbuilder'
  end
end
