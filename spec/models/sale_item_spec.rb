require 'rails_helper'

RSpec.describe SaleItem, type: :model do
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
      :user => @procurer
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
      :user => @cashier
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

  context "test sale_item relationships" do
    it "can find it's user" do
      expect(@sale_item.user).to eq( @cashier )
    end
    it "can find its register" do
      expect(@sale_item.register).to eq( @register )
    end
    it "can find its sale" do
      expect(@sale_item.sale).to eq( @sale )
    end
    it "can find its stock_item" do
      expect(@sale_item.stock_item).to eq( @stock_item )
    end
    it "can find its order_item" do
      expect(@sale_item.order_item).to eq( @order_item )
    end
    it "can find its product" do
      expect(@sale_item.product).to eq( @product )
    end
    it "can find its supplier" do
      expect(@sale_item.supplier).to eq( @supplier )
    end
    it "can find its order" do
      expect(@sale_item.order).to eq( @order )
    end
    # it "can find its procurer" do
    #   expect(@sale_item.procurer).to eq( @procurer )
    # end
  end

end
