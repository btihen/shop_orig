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
    @register = Register.create!(
      :open_amount => Money.new(10000, 'CHF'),
      :close_amount => Money.new(9000, 'CHF'),
      :user => @user
    )
  end

  context "test stock_items relationships" do
    it "can find its orders" do
      expect(@user.orders).to eq( [@order] )
    end
    it "can find its order_items" do
      expect(@user.order_items).to eq( [@order_item] )
    end
    it "can find its stock_items" do
      expect(@user.stock_items).to eq( [@stock_item] )
    end
    #
    it "can find its registers" do
      expect(@user.registers).to eq( [@register] )
    end
    # it "can find its sales" do
    #   expect(@user.sales).to eq( [@sale] )
    # end
    # it "can find its sales_items" do
    #   expect(@user.sales_items).to eq( [@sales_items] )
    # end
  end

  context "check user relationships"

end
