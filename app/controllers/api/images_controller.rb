class Api::ImagesController < ApplicationController

  def index
    @images = Image.all
    render 'index.json.jbuilder'
  end

  def show
    @image = Image.find(params[:id])
    render 'show.json.jbuilder'
  end

  def create
    @image = Image.new(
      url: params[:url],
      product_id: params[:product_id]
      )
    @image.save
    render 'show.json.jbuilder'
  end

  def update
    @image = Image.find(params[:id])
    @image.url = params[:url] || @image.url
    @image.product_id = params[:product_id] || @image.product_id
    @image.save
    render 'show.json.jbuilder'
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    render json: {message: "Image successfully destroyed."}
  end
end
