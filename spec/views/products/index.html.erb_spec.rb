require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        :product_name => "Product Name",
        :description => "MyText",
        :order_price => Money.new(10000, 'CHF'),
        :order_currency => "Order Currency"
      ),
      Product.create!(
        :product_name => "Product Name",
        :description => "MyText",
        :order_price => Money.new(10000, 'CHF'),
        :order_currency => "Order Currency"
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
