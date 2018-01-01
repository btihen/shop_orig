class SupplierPackagesController < ApplicationController
  before_action :set_supplier_package, only: [:show, :edit, :update, :destroy]

  # GET /supplier_packages
  # GET /supplier_packages.json
  def index
    @supplier_packages = SupplierPackage.all
  end

  # GET /supplier_packages/1
  # GET /supplier_packages/1.json
  def show
  end

  # GET /supplier_packages/new
  def new
    @supplier_package = SupplierPackage.new
  end

  # GET /supplier_packages/1/edit
  def edit
  end

  # POST /supplier_packages
  # POST /supplier_packages.json
  def create
    @supplier_package = SupplierPackage.new(supplier_package_params)

    respond_to do |format|
      if @supplier_package.save
        format.html { redirect_to @supplier_package, notice: 'Supplier package was successfully created.' }
        format.json { render :show, status: :created, location: @supplier_package }
      else
        format.html { render :new }
        format.json { render json: @supplier_package.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /supplier_packages/1
  # PATCH/PUT /supplier_packages/1.json
  def update
    respond_to do |format|
      if @supplier_package.update(supplier_package_params)
        format.html { redirect_to @supplier_package, notice: 'Supplier package was successfully updated.' }
        format.json { render :show, status: :ok, location: @supplier_package }
      else
        format.html { render :edit }
        format.json { render json: @supplier_package.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supplier_packages/1
  # DELETE /supplier_packages/1.json
  def destroy
    @supplier_package.destroy
    respond_to do |format|
      format.html { redirect_to supplier_packages_url, notice: 'Supplier package was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplier_package
      @supplier_package = SupplierPackage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supplier_package_params
      params.require(:supplier_package).permit( :product_id,
                                                :included_product_id,
                                                :included_quantity,
                                              )
    end
end
