require 'rails_helper'

RSpec.describe "stock_items/new", type: :view do
  before(:each) do
    @supplier = assign(:supplier, FactoryBot.create(:supplier) )
    @product = assign(:product, Product.create!(
      :product_name => "MyString",
      :description => "MyText",
      :product_price => Money.new(10000, 'CHF'),
      :product_currency => "MyString",
      :supplier => @supplier
    ))
    @sourcer = assign(:user, FactoryBot.create(:sourcer) )
    @order = assign(:order, Order.create!(
      :status => "MyString",
      :reason => "MyText",
      :sourcer => @sourcer
    ))
    @order_item = assign(:order_item, OrderItem.create!(
      :quantity => 1,
      :note => "MyText",
      :item_purchase_price => Money.new(10000, 'CHF'),
      :product => @product,
      :order => @order
    ))
    assign(:stock_item, StockItem.new(
      :status => "MyString",
      :sale_price => Money.new(10000, 'CHF'),
      :order_item => @order_item
    ))
  end

  it "renders new stock_item form" do
    render

    assert_select "form[action=?][method=?]", stock_items_path, "post" do

      assert_select "input[name=?]", "stock_item[status]"

      assert_select "input[name=?]", "stock_item[sale_price]"

      assert_select "input[name=?]", "stock_item[order_item_id]"
    end
  end
end
