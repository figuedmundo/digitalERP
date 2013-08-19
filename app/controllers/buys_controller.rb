class BuysController < ApplicationController
  def new
    @buy = Buy.new
  end

  def create
    # supplier = Supplier.find_by_id(params[:buy])
    # product
    @buy = Buy.new(params[:buy])
    # p = params[:buy]
    # flash[:notice] = "#{params[p]}"
    if @buy.save
      @buy.product.total = @buy.product.total + @buy.amount
      @buy.product.save
      flash[:success] = "Registrado"
      redirect_to new_buy_path
    else
      flash[:notice] = "not created..."
      render :new
    end
  end

  def index
    @buys = Buy.order(:created_at).all
  end
end


# :buy => {"product_id"=>"13",  "supplier_id"=>"2", "amount"=>"20", "price"=>"10"}