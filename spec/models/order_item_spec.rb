require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

    context "Check Supplier Relationships" do
      before(:each) do
        @sourcer = User.create!(
          :username => "MyUsernane",
          :full_name => "MyName",
          :role => "MyRole"
        )
        @supplier = Supplier.create!(
            :supplier_name => "MySupplier",
            :description => "MyText"
          )
        @product = Product.create!(
          :product_name => "MyProduct",
          :description => "MyText",
          :product_price => Money.new(10000, 'CHF'),
          :product_currency => "MyString",
          :supplier => @supplier
        )
        @order = Order.create!(
          :status => "MyString",
          :reason => "MyText",
          :sourcer => @sourcer
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
      it "Order Items can find their associated product" do
        expect( @order_item.product ).to eq( @product )
      end
      it "Order Items can find their associated supplier" do
        expect( @order_item.supplier ).to eq( @supplier )
      end
      it "can find which user stock_items this from this order_item" do
        expect( @order_item.stock_items ).to eq( [@stock_item] )
      end
    end

end
