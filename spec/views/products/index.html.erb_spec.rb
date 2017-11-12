require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    @supplier = assign(:supplier, Supplier.create!(
        :supplier_name => "MyString",
        :description => "MyText"
      ))
    assign(:products, [
      Product.create!(
        :product_name => "Product Name",
        :description => "MyText",
        :product_price => Money.new(10000, 'CHF'),
        :product_currency => "Order Currency",
        :supplier => @supplier
      ),
      Product.create!(
        :product_name => "Product Name",
        :description => "MyText",
        :product_price => Money.new(10000, 'CHF'),
        :product_currency => "Order Currency",
        :supplier => @supplier
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", :text => "Product Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "100.00".to_s, :count => 2
    assert_select "tr>td", :text => "Order Currency".to_s, :count => 2
  end
end
