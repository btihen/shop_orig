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
    @order_item = assign(:order_item, OrderItem.create!(
      :quantity => 2,
      :note => "MyText",
      :item_purchase_price => Money.new(10000, 'CHF'),
      # :product => @product
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/100.00/)
  end
end
