require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

    context "Check Supplier Relationships" do
      before(:each) do
        @user = User.create!(
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
          :user => @user
        )
        @order_item = OrderItem.create!(
          :quantity => 2,
          :note => "MyText",
          :item_purchase_price => Money.new(10000, 'CHF'),
          :product => @product,
          :order => @order
        )
      end
      it "Order Items can find their associated product" do
        expect( @order_item.product ).to eq(@product)
      end
      it "Order Items can find their associated supplier" do
        expect( @order_item.supplier ).to eq(@supplier)
      end
    end

end
