require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    @products = assign(:products, [
                        FactoryBot.create(:product),
                        FactoryBot.create(:product),
                      ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", :text => @products[0].product_name, :count => 1
    assert_select "tr>td", :text => @products[1].product_name, :count => 1
    assert_select "tr>td", :text => @products[0].description, :count => 1
    assert_select "tr>td", :text => @products[1].description, :count => 1
    assert_select "tr>td", :text => @products[0].product_price.to_s, :count => 1
    assert_select "tr>td", :text => @products[1].product_price.to_s, :count => 1
    # assert_select "tr>td", :text => @products[0].product_currency.to_s, :count => 1
    # assert_select "tr>td", :text => @products[1].product_currency.to_s, :count => 1
    # assert_select "tr>td", :text => "Order Currency".to_s, :count => 2
  end
end
