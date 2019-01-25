class Api::ProductsController < ApplicationController
  def index
    @products = Product.all

    search_term = params[:search]
    if search_term
      @products = Product.where("name LIKE ?", "%#{search_term}%")
    end

    discount = params[:discount]
    if discount
      @products = Product.where("price < ?", 10)
    end

    sort_term = params[:sort]
    sort_order = params[:sort_order]
    
    if sort_term == "price"
      if sort_order == "desc"
        @products = @products.order(price: :desc)
      else
        @products = @products.order(:price)
      end
    else
      @products = @products.order(:id)
    end
    render 'index.json.jbuilder'
  end

  def show
    @product = Product.find(params[:id])
    render 'show.json.jbuilder'
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      image_id: params[:image_id],
      description: params[:description],
      in_stock: params[:in_stock],
      supplier_id: params[:supplier_id]
      )
    if @product.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @product = Product.find(params[:id])
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.image_id = params[:image_id] || @product.image_id
    @product.description = params[:description] || @product.description
    @product.in_stock = params[:in_stock] || @product.in_stock
    @product.supplier_id = params[:supplier_id] || @product.supplier_id
    if @product.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    render json: {message: "Product successfully destroyed."}
  end
end
