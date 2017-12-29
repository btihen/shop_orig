require 'rails_helper'

RSpec.describe "products/show", type: :view do
  before(:each) do
    @product = assign(:product, FactoryBot.create(:product) )
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{CGI.escapeHTML(@product.product_name.to_s)}/)
    expect(rendered).to match(/#{CGI.escapeHTML(@product.product_description.to_s)}/)
    expect(rendered).to match(/#{@product.product_supplier_price}/)
    expect(rendered).to match(/#{@product.product_resell_item_price}/)
    expect(rendered).to match(/#{@product.supplier.supplier_currency}/)
  end
end
