require 'rails_helper'

RSpec.describe Order, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  context "test relationships" do
    before(:each) do
      @procurer = User.create!(
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
        :procurer => @procurer
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
    it "order to find its user" do
      expect( @order.procurer ).to eq( @procurer )
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
    it "order knows it stock_items" do
      expect( @order.stock_items ).to eq( [@stock_item] )
    end
  end


end
