class Api::CartedProductsController < ApplicationController

  before_action :authenticate_user

  def index
    @carted_products = current_user.carted_products.where(status: "Carted")
    render 'index.json.jbuilder'
  end

  def create
    @carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "Carted"
      )
    @carted_product.save
    render json: {message: "Carted product successfully created."}
  end

  def destroy
    carted_product = CartedProduct.find(params[:id])
    carted_product.update(status: "Removed")
    render json: {status: "Carted Product successfully removed."}
  end
end
