require 'rails_helper'

RSpec.describe "products/show", type: :view do
  before(:each) do
    @product = assign(:product, FactoryBot.create(:product) )
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{CGI.escapeHTML(@product.product_name)}/)
    expect(rendered).to match(/#{CGI.escapeHTML(@product.product_description.to_s)}/)
    expect(rendered).to match(/#{@product.product_purchase_price}/)
    # expect(rendered).to match(/#{@product.product_purchase_price_currency}/)
  end
end
