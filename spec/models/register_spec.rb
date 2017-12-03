require 'rails_helper'

RSpec.describe Register, type: :model do

  let(:register)    { FactoryBot.build(:register) }
  #
  let!(:supplier)   { FactoryBot.create(:supplier) }
  let!(:product)    { FactoryBot.create(:product,
                                        supplier:   supplier) }
  #
  let!(:sourcer)    { FactoryBot.create(:user) }
  let!(:order)      { FactoryBot.create(:order,
                                        sourcer:    sourcer) }
  let!(:order_item) { FactoryBot.create(:order_item,
                                        product:    product,
                                        order:      order) }
  let!(:stock_item) { FactoryBot.create(:stock_item,
                                        order_item: order_item) }
  #
  let!(:cashier)    { FactoryBot.create(:user) }
  let!(:register)   { FactoryBot.create(:register,
                                        cashier:    cashier) }
  let!(:sale)       { FactoryBot.create(:sale,
                                        register:   register) }
  let!(:sale_item)  { FactoryBot.create(:sale_item,
                                        sale:       sale,
                                        stock_item: stock_item) }

  context "verify factory" do
    it "correctly builds register" do
      expect( register.valid? ).to be_truthy
      expect( register.errors[:details]).to eq( [] )
      expect( register.errors[:messages]).to eq( [] )
    end
  end

  context "find model relationships" do
    it "register to find its user" do
      expect( register.cashier ).to eq( cashier )
    end
    it "register to find its sales" do
      expect( register.sales ).to eq( [sale] )
    end
    it "register to find its sales_items" do
      expect( register.sale_items ).to eq( [sale_item] )
    end
    it "register to find its order_items" do
      expect( register.order_items ).to eq( [order_item] )
    end
    it "register to find its products_sold" do
      expect( register.products_sold ).to eq( [product] )
    end
  end

end
