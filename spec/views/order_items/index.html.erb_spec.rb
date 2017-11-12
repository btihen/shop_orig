require 'rails_helper'

RSpec.describe "order_items/index", type: :view do
  before(:each) do
    @supplier = assign(:supplier, Supplier.create!(
        :supplier_name => "MyString",
        :description => "MyText"
      ))
    @product = assign(:product, Product.create!(
      :product_name => "MyString",
      :description => "MyText",
      :product_price => Money.new(10000, 'CHF'),
      :product_currency => "MyString",
      :supplier => @supplier
    ))
    assign(:order_items, [
      OrderItem.create!(
        :quantity => 2,
        :note => "MyText",
        :item_purchase_price => Money.new(10000, 'CHF'),
        # :product => @product
      ),
      OrderItem.create!(
        :quantity => 2,
        :note => "MyText",
        :item_purchase_price => Money.new(10000, 'CHF'),
        # :product => @product
      )
    ])
  end

  it "renders a list of order_items" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "#{Money.new(10000, 'CHF')}".to_s, :count => 2
  end
end
