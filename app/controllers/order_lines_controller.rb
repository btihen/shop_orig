class OrderLinesController < ApplicationController
  before_action :set_order_line, only: [:show, :edit, :update, :destroy]

  def index
    @order_lines = OrderLine.all
  end

  def show
  end

  def new
    @order_line = OrderLine.new
  end

  def edit
  end

  def create
    @order_line = OrderLine.new(order_line_params)

    respond_to do |format|
      if @order_line.save
        format.html { redirect_to @order_line, notice: 'Order item was successfully created.' }
        format.json { render :show, status: :created, location: @order_line }
      else
        format.html { render :new }
        format.json { render json: @order_line.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @order_line.update(order_line_params)
        format.html { redirect_to @order_line, notice: 'Order item was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_line }
      else
        format.html { render :edit }
        format.json { render json: @order_line.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order_line.destroy
    respond_to do |format|
      format.html { redirect_to order_lines_url, notice: 'Order item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_line
      @order_line = OrderLine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_line_params
      params.require(:order_line).permit( :order_line_quantity,
                                          :order_line_note,
                                          :order_line_actual_purchase_price,
                                          :order_line_actual_purchase_price_cents,
                                          :order_line_actual_purchase_price_currency,
                                          :product_id,
                                          :order_id,
                                        )
    end
end
