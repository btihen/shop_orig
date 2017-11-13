require 'rails_helper'

RSpec.describe "products/show", type: :view do
  before(:each) do
    @supplier = assign(:supplier, Supplier.create!(
        :supplier_name => "MyString",
        :description => "MyText"
      ))
    @product = assign(:product, Product.create!(
      :product_name => "Product Name",
      :description => "MyText",
      :product_price => Money.new(10000, 'CHF'),
      :product_currency => "CHF",
      :supplier => @supplier
    ))
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
