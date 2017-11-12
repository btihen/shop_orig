require 'rails_helper'

RSpec.describe "order_items/edit", type: :view do
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
    @order_item = assign(:order_item, OrderItem.create!(
      :quantity => 1,
      :note => "MyText",
      :item_purchase_price => Money.new(10000, 'CHF'),
      # :product => @product
    ))
  end

  it "renders the edit order_item form" do
    render

    assert_select "form[action=?][method=?]", order_item_path(@order_item), "post" do

      assert_select "input[name=?]", "order_item[quantity]"

      assert_select "textarea[name=?]", "order_item[note]"

      assert_select "input[name=?]", "order_item[item_purchase_price]"
    end
  end
end
