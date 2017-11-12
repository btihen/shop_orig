require 'rails_helper'

RSpec.describe "stock_items/index", type: :view do
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
    @user = assign(:user, User.create!(
      :username => "MyUsernane",
      :full_name => "MyName",
      :role => "MyRole"
    ))
    @order = assign(:order, Order.create!(
      :status => "MyString",
      :reason => "MyText",
      :user => @user
    ))
    @order_item = assign(:order_item, OrderItem.create!(
      :quantity => 1,
      :note => "MyText",
      :item_purchase_price => Money.new(10000, 'CHF'),
      :product => @product,
      :order => @order
    ))
    assign(:stock_items, [
      StockItem.create!(
        :status => "Status",
        :sale_price => Money.new(10000, 'CHF'),
        :order_item => @order_item
      ),
      StockItem.create!(
        :status => "Status",
        :sale_price => Money.new(10000, 'CHF'),
        :order_item => @order_item
      )
    ])
  end

  it "renders a list of stock_items" do
    render
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => "#{Money.new(10000, 'CHF')}".to_s, :count => 2
    # assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
