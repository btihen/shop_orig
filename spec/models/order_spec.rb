require 'rails_helper'

RSpec.describe Order, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  context "test relationships" do
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
    it "order to find its ordered-items" do
      expect( @order.order_items ).to eq( [@order_item] )
    end
    it "order to find its products ordered" do
      expect( @order.products ).to eq( [@product] )
    end
    it "order to find its supplier prociding products" do
      expect( @order.supplier ).to eq( [@supplier] )
    end

  end


end
