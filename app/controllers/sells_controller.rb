class SellsController < ApplicationController
  def new
    @sell = Sell.new
  end

  def create
    @sell = Sell.new(params[:sell])
    if @sell.save
      @sell.product.total = @sell.product.total - @sell.amount
      @sell.product.save
      flash[:success] = "Registrado"
      redirect_to @sell
    else
      flash[:notice] = "not created..."
      render :new
    end
  end

  def index
    @sells = Sell.all
  end

  def show
    @sell = Sell.find_by_id(params[:id])
  end
end

