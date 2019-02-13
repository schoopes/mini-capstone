class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @products = Product.all
    @suppliers = Supplier.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      supplier_id: params[:supplier_id]
      )
    @product.save
    redirect_to "/products/#{@product.id}"
  end

  def edit
    @product = Product.find(params[:id])
    @suppliers = Supplier.all
  end

  def update
    @product = Product.find(params[:id])
    @product.name = params[:name]
    @product.price = params[:price]
    @product.description = params[:description]
    if @product.save
      redirect_to "/products/#{@product.id}"
    else
      render json: {errors: @product.errors.full_messages}, status: 422
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to "/products"
  end
end
