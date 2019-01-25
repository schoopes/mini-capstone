class Api::SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all
    render 'index.json.jbuilder'
  end

  def show
    @supplier = Supplier.find(params[:id])
    render 'show.json.jbuilder'
  end

  def create
    @supplier = Supplier.new(
      name: params[:name],
      email: params[:email],
      phone_number: params[:phone_number]
      )
    @supplier.save
    render 'show.json.jbuilder'
  end

  def update
    @supplier = Supplier.find_by(params[:id])
    @supplier.name = params[:name] || @supplier.name,
    @supplier.email = params[:email] || @supplier.email,
    @supplier.phone_number = params[:phone_number] || @supplier.phone_number
    if @supplier.save
      render 'show.json.jbuilder'
    else 
      render json: {errors: @supplier.errors.full_messages}, status: :unprocessable_entity
    end  
  end

  def destroy
    @supplier = Supplier.find_by(params[:id])
    @supplier.destroy
    render json: {message: "Supplier successfully destroyed."}
  end
end
