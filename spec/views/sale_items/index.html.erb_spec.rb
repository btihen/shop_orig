require 'rails_helper'

RSpec.describe "sale_items/index", type: :view do
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
    @sourcer = assign( :user, FactoryBot.create(:sourcer) )
    # @sourcer = assign(:user, User.create!(
    #   :username => "MyUsernane",
    #   :full_name => "MyName",
    #   :role => "MyRole"
    # ))
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
    @stock_item = assign(:stock_item, StockItem.create!(
      :status => "MyString",
      :sale_price => Money.new(10000, 'CHF'),
      :order_item => @order_item
    ))
    ########
    @cashier = assign( :user, FactoryBot.create(:cashier) )
    # @cashier = assign(:user, User.create!(
    #   :username => "MyUsernane",
    #   :full_name => "MyName",
    #   :role => "MyRole"
    # ))
    @register = assign(:register, Register.create!(
      :start_amount => Money.new(10000, 'CHF'),
      :close_amount => Money.new(9000, 'CHF'),
      :cashier => @cashier
    ))
    @sale = assign(:sale, Sale.create!(
      :payment_method => "MyString",
      :register => @register
    ))
    @sale_items = assign(:sale_items, [
      SaleItem.create!(
        :note => "MyText0",
        :sale_price => Money.new(10000, 'CHF'),
        :sale => @sale,
        :stock_item => @stock_item
      ),
      SaleItem.create!(
        :note => "MyText1",
        :sale_price => Money.new(9000, 'CHF'),
        :sale => @sale,
        :stock_item => @stock_item
      )
    ])
  end

  it "renders a list of sale_items" do
    render
    assert_select "tr>td", :text => @sale_items[0].note.to_s, :count => 1
    assert_select "tr>td", :text => @sale_items[1].note.to_s, :count => 1
    assert_select "tr>td", :text => @sale_items[0].sale_price.to_s, :count => 1
    assert_select "tr>td", :text => @sale_items[1].sale_price.to_s, :count => 1
    assert_select "tr>td", :text => @sale_items[0].sale.id.to_s, :count => 2
  end
end
