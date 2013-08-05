class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])
    if @product.save
      flash[:success] = "Registrado"
      redirect_to new_product_path
    else
      # flash[:error] = "error"
      render :new
    end
  end

  def index
    @products = Product.all
    
  end
end
