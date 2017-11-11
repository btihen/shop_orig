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
      :order_price => Money.new(10000, 'CHF'),
      :order_currency => "CHF",
      :supplier => @supplier
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Product Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/100.00/)
    expect(rendered).to match(/CHF/)
  end
end
