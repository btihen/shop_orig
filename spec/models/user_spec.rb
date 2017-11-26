require 'rails_helper'

RSpec.describe User, type: :model do
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
    @procurer = User.create!(
      :username => "MyUsernane",
      :full_name => "MyName",
      :role => "MyRole"
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
      :stock_item => @stock_item
    )
  end

  context "test user relationships" do
    it "can find its orders" do
      expect(@procurer.orders).to eq( [@order] )
    end
    it "can find its order_items" do
      expect(@procurer.order_items).to eq( [@order_item] )
    end
    # it "can find its products_ordered" do
    #   expect(@procurer.products_ordered).to eq( [@products_ordered] )
    # end
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
    it "can find its stock_items" do
      expect(@cashier.stock_items).to eq( [@stock_item] )
    end
    # it "can find its products_sold" do
    #   expect(@procurer.products_sold).to eq( [@products_sold] )
    # end
  end

end
