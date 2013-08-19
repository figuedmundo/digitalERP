class SellsController < ApplicationController
  def new
    # flash[:notice] = "#{c.full_name}"
    @sell = Sell.new()
    customer = Customer.find_by_id(params[:customer])
    @sell.customer = customer unless customer.nil?
  end

  def create
    @sell = Sell.new(params[:sell])
    if @sell.save
      @sell.product.total = @sell.product.total - @sell.amount
      @sell.product.save
      if @sell.customer.last_name != "anonimo"
        redirect_to @sell
      else
        flash[:success] = "Venta Registrada"
        redirect_to new_sell_path
      end
    else
      flash[:notice] = "not created..."
      render :new
    end
  end

  def index
    @sells = Sell.order(:created_at).all
  end

  def show
    @sell = Sell.find_by_id(params[:id])
  end
end

