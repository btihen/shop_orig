require 'rails_helper'

RSpec.describe "sale_items/show", type: :view do
  before(:each) do
    @supplier = assign(:supplier, FactoryBot.create(:supplier) )
    @product = assign(:product, Product.create!(
      :product_name => "MyString",
      :description => "MyText",
      :product_price => Money.new(10000, 'CHF'),
      :product_currency => "MyString",
      :supplier => @supplier
    ))
    @sourcer = assign( :user, FactoryBot.create(:sourcer) )
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
    @register = assign(:register, Register.create!(
      :start_amount => Money.new(10000, 'CHF'),
      :close_amount => Money.new(9000, 'CHF'),
      :cashier => @cashier
    ))
    @sale = assign(:sale, Sale.create!(
      :payment_method => "MyString",
      :register => @register
    ))
    @sale_item = assign(:sale_item, SaleItem.create!(
      :note => "MyText",
      :sale_price => Money.new(9000, 'CHF'),
      :sale => @sale,
      :stock_item => @stock_item
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@sale_item.note}/)
    expect(rendered).to match(/#{@sale_item.sale_price}/)
    expect(rendered).to match(/#{@sale_item.sale.id}/)
  end
end
