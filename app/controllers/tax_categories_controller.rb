class TaxCategoriesController < ApplicationController
  before_action :set_tax_category, only: [:show, :edit, :update, :destroy]

  def index
    @tax_categories = TaxCategory.all
  end

  def show
  end

  def new
    @tax_category = TaxCategory.new
  end

  def edit
  end

  def create
    @tax_category = TaxCategory.new(tax_category_params)

    respond_to do |format|
      if @tax_category.save
        format.html { redirect_to @tax_category, notice: 'Tax category was successfully created.' }
        format.json { render :show, status: :created, location: @tax_category }
      else
        format.html { render :new }
        format.json { render json: @tax_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @tax_category.update(tax_category_params)
        format.html { redirect_to @tax_category, notice: 'Tax category was successfully updated.' }
        format.json { render :show, status: :ok, location: @tax_category }
      else
        format.html { render :edit }
        format.json { render json: @tax_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tax_category.destroy
    respond_to do |format|
      format.html { redirect_to tax_categories_url, notice: 'Tax category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tax_category
      @tax_category = TaxCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tax_category_params
      params.require(:tax_category).permit( :tax_category_name,
                                            :tax_category_rate,
                                            # :tax_start_date,
                                            # :tax_end_date,
                                          )
    end
end
