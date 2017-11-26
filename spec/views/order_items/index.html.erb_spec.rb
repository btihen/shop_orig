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
    @sourcer = assign(:user, User.create!(
      :username => "MyUsernane",
      :full_name => "MyName",
      :role => "MyRole"
    ))
    @order = assign(:order, Order.create!(
      :status => "MyString",
      :reason => "MyText",
      :sourcer => @sourcer
    ))
    @order_items = assign(:order_items, [
      OrderItem.create!(
        :quantity => 1,
        :note => "MyText1",
        :item_purchase_price => Money.new(10000, 'CHF'),
        :product => @product,
        :order => @order
      ),
      OrderItem.create!(
        :quantity => 2,
        :note => "MyText2",
        :item_purchase_price => Money.new(9000, 'CHF'),
        :product => @product,
        :order => @order
      )
    ])
  end

  it "renders a list of order_items" do
    render
    assert_select "tr>td", :text => @order_items[0].quantity.to_s, :count => 1
    assert_select "tr>td", :text => @order_items[1].quantity.to_s, :count => 1
    assert_select "tr>td", :text => @order_items[0].note.to_s, :count => 1
    assert_select "tr>td", :text => @order_items[1].note.to_s, :count => 1
    assert_select "tr>td", :text => @order_items[0].item_purchase_price.to_s, :count => 1
    assert_select "tr>td", :text => @order_items[1].item_purchase_price.to_s, :count => 1
  end
end
