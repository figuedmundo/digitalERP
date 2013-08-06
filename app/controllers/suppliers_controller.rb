class SuppliersController < ApplicationController
  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new(params[:supplier])
    if @supplier.save
      flash[:success] = "Proveedor registrado"
      redirect_to new_supplier_path
    else
      flash[:notice] = "not created..."
      render :new
    end
  end

  def edit
  end
end
