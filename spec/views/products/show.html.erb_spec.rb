require 'rails_helper'

RSpec.describe "products/show", type: :view do
  before(:each) do
    @product = assign(:product, FactoryBot.create(:product) )
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@product.product_name}/)
    expect(rendered).to match(/#{@product.description}/)
    expect(rendered).to match(/#{@product.product_price}/)
    expect(rendered).to match(/#{@product.product_price_currency}/)
    # expect(rendered).to match(/#{@product.product_currency}/)
  end
end
