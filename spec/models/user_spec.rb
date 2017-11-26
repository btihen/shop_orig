require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before(:each) do
    @supplier = Supplier.create!(
      :supplier_name => "MyString",
      :description => "MyText"
    )
    @product1 = Product.create!(
      :product_name => "MyString",
      :description => "MyText",
      :product_price => Money.new(10000, 'CHF'),
      :product_currency => "MyString",
      :supplier => @supplier
    )
    @product2 = Product.create!(
      :product_name => "MyString",
      :description => "MyText",
      :product_price => Money.new(10000, 'CHF'),
      :product_currency => "MyString",
      :supplier => @supplier
    )
    ######
    @sourcer = User.create!(
      :username => "MyUsernane",
      :full_name => "MyName",
      :role => "MyRole"
    )
    @order1 = Order.create!(
      :status => "MyString",
      :reason => "MyText",
      :sourcer => @sourcer
    )
    @order2 = Order.create!(
      :status => "MyString",
      :reason => "MyText",
      :sourcer => @sourcer
    )
    @order_item1 = OrderItem.create!(
      :quantity => 2,
      :note => "MyText",
      :item_purchase_price => Money.new(10000, 'CHF'),
      :product => @product1,
      :order => @order1
    )
    @order_item2 = OrderItem.create!(
      :quantity => 2,
      :note => "MyText",
      :item_purchase_price => Money.new(10000, 'CHF'),
      :product => @product2,
      :order => @order2
    )
    @stock_item1 = StockItem.create!(
      :status => "MyString",
      :sale_price => Money.new(10000, 'CHF'),
      :order_item => @order_item1
    )
    @stock_item2 = StockItem.create!(
      :status => "MyString",
      :sale_price => Money.new(10000, 'CHF'),
      :order_item => @order_item2
    )
    #####################
    @cashier = User.create!(
      :username => "MyUsernane",
      :full_name => "MyName",
      :role => "MyRole"
    )
    @register = Register.create!(
      :start_amount => Money.new(10000, 'CHF'),
      :close_amount => Money.new(9000, 'CHF'),
      :cashier => @cashier
    )
    @sale = Sale.create!(
      :payment_method => "MyString",
      :register => @register
    )
    @sale_item = SaleItem.create!(
      :note => "MyText",
      :sale_price => Money.new(9000, 'CHF'),
      :sale => @sale,
      :stock_item => @stock_item2
    )
  end

  context "test user relationships" do
    it "can find its orders" do
      expect(@sourcer.orders).to eq( [@order1, @order2] )
    end
    it "can find its order_items" do
      expect(@sourcer.order_items).to eq( [@order_item1, @order_item2] )
    end
    it "can find its products_ordered" do
      expect(@sourcer.products_ordered).to eq( [@product1, @product2] )
    end
    #
    it "can find its registers" do
      expect(@cashier.registers).to eq( [@register] )
    end
    it "can find its sales" do
      expect(@cashier.sales).to eq( [@sale] )
    end
    it "can find its sales_items" do
      expect(@cashier.sale_items).to eq( [@sale_item] )
    end
    it "can find its sold_stock_items" do
      expect(@cashier.stock_items).to eq( [@stock_item2] )
    end
    it "can find its sold_order_items" do
      expect(@cashier.sold_order_items).to eq( [@order_item2] )
    end
    it "can find its products_sold" do
      expect(@cashier.products_sold).to eq( [@product2] )
    end
  end

end
