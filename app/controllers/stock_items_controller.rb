class StockItemsController < ApplicationController
  before_action :set_stock_item, only: [:show, :edit, :update, :destroy]

  def index
    @stock_items = StockItem.all
  end

  def show
  end

  def new
    @stock_item = StockItem.new
  end

  def edit
  end

  def create
    @stock_item = StockItem.new(stock_item_params)

    respond_to do |format|
      if @stock_item.save
        format.html { redirect_to @stock_item, notice: 'Stock item was successfully created.' }
        format.json { render :show, status: :created, location: @stock_item }
      else
        format.html { render :new }
        format.json { render json: @stock_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @stock_item.update(stock_item_params)
        format.html { redirect_to @stock_item, notice: 'Stock item was successfully updated.' }
        format.json { render :show, status: :ok, location: @stock_item }
      else
        format.html { render :edit }
        format.json { render json: @stock_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @stock_item.destroy
    respond_to do |format|
      format.html { redirect_to stock_items_url, notice: 'Stock item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock_item
      @stock_item = StockItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stock_item_params
      params.require(:stock_item).permit( :stock_item_status,
                                          :stock_item_added_datetime,
                                          :stock_item_resell_price,
                                          :stock_item_sold_datetime,
                                          :stock_item_sold_price,
                                          :stock_item_sold_price_cents,
                                          :stock_item_sold_price_currency,
                                          :stock_item_stock_item_sold_datetime,
                                          :order_line_id,
                                        )
    end
end
