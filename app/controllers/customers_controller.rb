class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(params[:customer])
    if @customer.save
      flash[:success] = "Cliente registrado"
      redirect_to new_customer_path
    else
      flash[:notice] = "not created..."
      render :new
    end
  end

  def edit
  end
end
