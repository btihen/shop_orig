require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    @supplier = assign(:supplier, Supplier.create!(
        :supplier_name => "MyString",
        :description => "MyText"
      ))
    @products = assign(:products, [
      Product.create!(
        :product_name => "Product Name0",
        :description => "MyText0",
        :product_price => Money.new(10000, 'CHF'),
        :product_currency => "CHF",
        :supplier => @supplier
      ),
      Product.create!(
        :product_name => "Product Name1",
        :description => "MyText1",
        :product_price => Money.new(9000, 'EUR'),
        :product_currency => "EUR",
        :supplier => @supplier
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", :text => @products[0].product_name.to_s, :count => 1
    assert_select "tr>td", :text => @products[1].product_name.to_s, :count => 1
    assert_select "tr>td", :text => @products[0].description.to_s, :count => 1
    assert_select "tr>td", :text => @products[1].description.to_s, :count => 1
    assert_select "tr>td", :text => @products[0].product_price.to_s, :count => 1
    assert_select "tr>td", :text => @products[1].product_price.to_s, :count => 1
    assert_select "tr>td", :text => @products[0].product_price_currency.to_s, :count => 1
    assert_select "tr>td", :text => @products[1].product_price_currency.to_s, :count => 1
    # assert_select "tr>td", :text => "Order Currency".to_s, :count => 2
  end
end
