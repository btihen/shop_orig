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
    assert_select "tr>td", :text => @products[0].product_description, :count => 1
    assert_select "tr>td", :text => @products[1].product_description, :count => 1
    assert_select "tr>td", :text => @products[0].product_supplier_price.to_s, :count => 1
    assert_select "tr>td", :text => @products[1].product_supplier_price.to_s, :count => 1
    assert_select "tr>td", :text => @products[0].product_resell_item_price.to_s, :count => 1
    assert_select "tr>td", :text => @products[1].product_resell_item_price.to_s, :count => 1
    # assert_select "tr>td", :text => @products[0].supplier.supplier_currency.to_s, :count => 1
    # assert_select "tr>td", :text => @products[1].supplier.supplier_currency.to_s, :count => 1
  end
end
