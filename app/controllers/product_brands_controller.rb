class ProductBrandsController < ApplicationController
  def new
    @brand = ProductBrand.new
  end
  def create
    @brand = ProductBrand.new(params[:product_brand])
    if @brand.save
      flash[:success] = "Registrado"
      redirect_to new_product_brand_path
    else
      render :new
    end
  end
end
