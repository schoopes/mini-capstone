class Api::OrdersController < ApplicationController

  before_action :authenticate_user

  def index
    @orders = current_user.orders
    render 'index.json.jbuilder'
  end

  def create
    carted_products = current_user.carted_products.where(status: "Carted")
    subtotal = 0
    carted_products.each do |carted_product|
      subtotal += carted_product.product.price * carted_product.quantity
    end
    tax = subtotal * 0.09
    total = subtotal + tax
    @order = Order.new(
      user_id: current_user.id,
      subtotal: subtotal,
      tax: tax,
      total: total,
      )
    if @order.save
      carted_products.update_all(status: "Purchased", order_id: @order.id)
      render 'show.json.jbuilder'
    else
      render json: {errors: @order.errors.full_messages}, status: 422
    end
  end
end
