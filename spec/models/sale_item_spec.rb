require 'rails_helper'

RSpec.describe SaleItem, type: :model do

  let(:sale_item)         { FactoryBot.build(:sale_item) }
  let(:invalid_sale_item) { FactoryBot.build(:invalid_sale_item) }
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
    it "correctly builds sale_item" do
      expect( sale_item.valid? ).to be_truthy
      expect( sale_item.errors.details).to eq( {} )
      expect( sale_item.errors.messages).to eq( {} )
    end
    it "correctly detects invalid_sale_item" do
      expect( invalid_sale_item.valid? ).to be_falsey
      # expect( invalid_sale_item.errors.details[:sale]).to eq( [{:error=>:blank}] )
      # expect( invalid_sale_item.errors.details[:sale_price][0][:error]).to eq( :greater_than_or_equal_to )
      expect( invalid_sale_item.errors.messages).to eq(
                                { :sale=>["must exist"],
                                  :stock_item=>["must exist"],
                                  :sale_price=>["must be greater than or equal to 0"]} )
    end
  end

  context "test sale_item relationships" do
    it "can find it's user" do
      expect(sale_item.cashier).to eq( cashier )
    end
    it "can find its register" do
      expect(sale_item.register).to eq( register )
    end
    it "can find its sale" do
      expect(sale_item.sale).to eq( sale )
    end
    it "can find its stock_item" do
      expect(sale_item.stock_item).to eq( stock_item )
    end
    it "can find its order_item" do
      expect(sale_item.order_item).to eq( order_item )
    end
    it "can find its product" do
      expect(sale_item.product).to eq( product )
    end
    it "can find its supplier" do
      expect(sale_item.supplier).to eq( supplier )
    end
    it "can find its order" do
      expect(sale_item.order).to eq( order )
    end
    it "can find its sourcer" do
      expect(sale_item.sourcer).to eq( sourcer )
    end
  end

end
