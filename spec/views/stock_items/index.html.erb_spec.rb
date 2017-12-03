require 'rails_helper'

RSpec.describe "stock_items/index", type: :view do
  before(:each) do
    # @supplier = assign(:supplier, FactoryBot.create(:supplier) )
    # @product = assign(:product, Product.create!(
    #   :product_name => "MyString",
    #   :description => "MyText",
    #   :product_price => Money.new(10000, 'CHF'),
    #   :product_currency => "MyString",
    #   :supplier => @supplier
    # ))
    # @sourcer = assign(:user, FactoryBot.create(:sourcer) )
    # @order = assign(:order, Order.create!(
    #   :status => "MyString",
    #   :reason => "MyText",
    #   :sourcer => @sourcer
    # ))
    # @order_item = assign(:order_item, OrderItem.create!(
    #   :quantity => 1,
    #   :note => "MyText",
    #   :item_purchase_price => Money.new(10000, 'CHF'),
    #   :product => @product,
    #   :order => @order
    # ))
    @stock_items = assign(:stock_items, [
                            FactoryBot.create(:stock_item, status: 'available'),
                            FactoryBot.create(:stock_item, status: 'sold'),
                          ])
  end

  it "renders a list of stock_items" do
    render
    assert_select "tr>td", :text => @stock_items[0].status.to_s, :count => 1
    assert_select "tr>td", :text => @stock_items[1].status.to_s, :count => 1
    assert_select "tr>td", :text => @stock_items[0].sale_price.to_s, :count => 1
    assert_select "tr>td", :text => @stock_items[1].sale_price.to_s, :count => 1
    assert_select "tr>td", :text => @stock_items[0].order_item.id.to_s, :count => 1
    assert_select "tr>td", :text => @stock_items[1].order_item.id.to_s, :count => 1
  end
end
