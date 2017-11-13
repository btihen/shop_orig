require 'rails_helper'

RSpec.describe "order_items/show", type: :view do
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
      :quantity => 2,
      :note => "MyText",
      :item_purchase_price => Money.new(10000, 'CHF'),
      :product => @product,
      :order => @order
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@order_item.quantity}/)
    expect(rendered).to match(/#{@order_item.note}/)
    expect(rendered).to match(/#{@order_item.item_purchase_price}/)
  end
end
