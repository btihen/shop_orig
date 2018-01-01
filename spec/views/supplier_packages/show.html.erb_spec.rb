require 'rails_helper'

RSpec.describe "supplier_packages/show", type: :view do
  before(:each) do
    @supplier_package = assign(:supplier_package, FactoryBot.create(:supplier_package) )
    # @supplier_package = assign(:supplier_package, SupplierPackage.create!(
    #   :product => nil,
    #   :included_product => nil,
    #   :included_quantity => 2
    # ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{CGI.escapeHTML(@supplier_package.product.product_name.to_s)}/)
    expect(rendered).to match(/#{CGI.escapeHTML(@supplier_package.included_product.product_name.to_s)}/)
    expect(rendered).to match(/#{@supplier_package.included_quantity}/)
  end
end
