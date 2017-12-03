require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user)          { FactoryBot.build(:user) }
  #
  let!(:supplier)     { FactoryBot.create(:supplier) }
  let!(:product1)     { FactoryBot.create(:product,
                                          supplier:   supplier) }
  let!(:product2)     { FactoryBot.create(:product,
                                          supplier:   supplier) }
  #
  let!(:sourcer)      { FactoryBot.create(:user) }
  let!(:order1)       { FactoryBot.create(:order,
                                          sourcer:    sourcer) }
  let!(:order2)       { FactoryBot.create(:order,
                                          sourcer:    sourcer) }
  let!(:order_item1)  { FactoryBot.create(:order_item,
                                          product:    product1,
                                          order:      order1) }
  let!(:order_item2)  { FactoryBot.create(:order_item,
                                          product:    product2,
                                          order:      order2) }
  let!(:stock_item1)  { FactoryBot.create(:stock_item,
                                          order_item: order_item1) }
  let!(:stock_item2)  { FactoryBot.create(:stock_item,
                                          order_item: order_item2) }
  #
  let!(:cashier)      { FactoryBot.create(:user) }
  let!(:register)     { FactoryBot.create(:register,
                                          cashier:    cashier) }
  let!(:sale)         { FactoryBot.create(:sale,
                                          register:   register) }
  let!(:sale_item)    { FactoryBot.create(:sale_item,
                                          sale:       sale,
                                          stock_item: stock_item2) }

  context "verify factory" do
    it "correctly builds user" do
      expect( user.valid? ).to be_truthy
      expect( user.errors[:details]).to eq( [] )
      expect( user.errors[:messages]).to eq( [] )
    end
  end

  context "test relationships" do
    it "sourcer can find its orders" do
      expect(sourcer.orders).to eq( [order1, order2] )
    end
    it "sourcer can find its order_items" do
      expect(sourcer.order_items).to eq( [order_item1, order_item2] )
    end
    it "sourcer can find its products_ordered" do
      expect(sourcer.products_ordered).to eq( [product1, product2] )
    end
    #
    it "cashier can find its registers" do
      expect(cashier.registers).to eq( [register] )
    end
    it "cashier can find its sales" do
      expect(cashier.sales).to eq( [sale] )
    end
    it "cashier can find its sales_items" do
      expect(cashier.sale_items).to eq( [sale_item] )
    end
    it "cashier can find its sold_stock_items" do
      expect(cashier.stock_items).to eq( [stock_item2] )
    end
    it "cashier can find its sold_order_items" do
      expect(cashier.sold_order_items).to eq( [order_item2] )
    end
    it "cashier can find its products_sold" do
      expect(cashier.products_sold).to eq( [product2] )
    end
  end

end
