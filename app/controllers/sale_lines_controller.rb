class SaleLinesController < ApplicationController
  before_action :set_sale_line, only: [:show, :edit, :update, :destroy]

  def index
    @sale_lines = SaleLine.all
  end

  def show
  end

  def new
    @sale_line = SaleLine.new
  end

  def edit
  end

  def create
    @sale_line = SaleLine.new(sale_line_params)

    respond_to do |format|
      if @sale_line.save
        format.html { redirect_to @sale_line, notice: 'Sale item was successfully created.' }
        format.json { render :show, status: :created, location: @sale_line }
      else
        format.html { render :new }
        format.json { render json: @sale_line.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @sale_line.update(sale_line_params)
        format.html { redirect_to @sale_line, notice: 'Sale item was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale_line }
      else
        format.html { render :edit }
        format.json { render json: @sale_line.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @sale_line.destroy
    respond_to do |format|
      format.html { redirect_to sale_lines_url, notice: 'Sale item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale_line
      @sale_line = SaleLine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_line_params
      params.require(:sale_line).permit(:sale_line_note,
                                        :sale_id,
                                        :sale_line_quantity,
                                        :sale_line_sale_price,
                                        :sale_line_sale_price_cents,
                                        :sale_line_sale_price_currency,
                                        :sale_line_note,
                                        :stock_item_id,
                                      )
    end
end
