require 'rails_helper'

RSpec.describe StockItem, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before(:each) do
    @supplier = Supplier.create!(
      :supplier_name => "MyString",
      :description => "MyText"
    )
    @product = Product.create!(
      :product_name => "MyString",
      :description => "MyText",
      :product_price => Money.new(10000, 'CHF'),
      :product_currency => "MyString",
      :supplier => @supplier
    )
    @user = User.create!(
      :username => "MyUsernane",
      :full_name => "MyName",
      :role => "MyRole"
    )
    @order = Order.create!(
      :status => "MyString",
      :reason => "MyText",
      :user => @user
    )
    @order_item = OrderItem.create!(
      :quantity => 2,
      :note => "MyText",
      :item_purchase_price => Money.new(10000, 'CHF'),
      :product => @product,
      :order => @order
    )
    @stock_item = StockItem.create!(
      :status => "MyString",
      :sale_price => Money.new(10000, 'CHF'),
      :order_item => @order_item
    )
  end

  context "test stock_items relationships" do
    it "can find its order_item" do
      expect(@stock_item.order_item).to eq(@order_item)
    end
    it "can find its product" do
      expect(@stock_item.product).to eq(@product)
    end
    it "can find its supplier" do
      expect(@stock_item.supplier).to eq(@supplier)
    end
    it "can find its order" do
      expect(@stock_item.order).to eq(@order)
    end
    it "can find which user ordered this item" do
      expect(@stock_item.user).to eq(@user)
    end
  end
end
