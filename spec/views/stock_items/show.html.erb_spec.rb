require 'rails_helper'

RSpec.describe "stock_items/show", type: :view do
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
    @sourcer = assign(:user, FactoryBot.create(:sourcer) )
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
      :status => "Status",
      :sale_price => Money.new(10000, 'CHF'),
      :order_item => @order_item
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@stock_item.status}/)
    expect(rendered).to match(/#{@stock_item.sale_price}/)
    expect(rendered).to match(/#{@stock_item.order_item.id}/)
  end
end
