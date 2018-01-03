require 'rails_helper'

RSpec.describe StockItem, type: :model do

  let(:stock_item)          { FactoryBot.create(:stock_item) }
  let(:invalid_stock_item)  { FactoryBot.build(:invalid_stock_item) }
  #
  let!(:supplier)   { FactoryBot.create(:supplier) }
  let!(:product)    { FactoryBot.create(:product,
                                        supplier:   supplier) }
  #
  let!(:sourcer)    { FactoryBot.create(:user) }
  let!(:order)      { FactoryBot.create(:order,
                                        sourcer:    sourcer) }
  let!(:order_line) { FactoryBot.create(:order_line,
                                        product:    product,
                                        order:      order) }
  let!(:stock_item) { FactoryBot.create(:stock_item,
                                        order_line: order_line) }
  #
  let!(:cashier)    { FactoryBot.create(:user) }
  let!(:register)   { FactoryBot.create(:register,
                                        cashier:    cashier) }
  let!(:sale)       { FactoryBot.create(:sale,
                                        register:   register) }
  let!(:sale_line)  { FactoryBot.create(:sale_line,
                                        sale:       sale,
                                        stock_item: stock_item) }

  context "verify factory" do
    it "correctly builds stock_item" do
      expect( stock_item.valid? ).to be_truthy
      expect( stock_item.errors.details).to eq( {} )
      expect( stock_item.errors.messages).to eq( {} )
    end
    it "detects an invalid_stock_item" do
      expect( invalid_stock_item.valid? ).to be_falsey
      # expect( invalid_stock_item.errors.details[:stock_item_status][0][:error]).to eq( :inclusion )
      expect( invalid_stock_item.errors.messages).to eq(
                                { order_line: ["must exist"],
                                  stock_item_sold_price: [],
                                  stock_item_status: ["is not included in the list"] } )
    end

  end

  context "test stock_items relationships" do
    it "can find its order_line" do
      expect(stock_item.order_line).to eq(order_line)
    end
    it "can find its product" do
      expect(stock_item.product).to eq(product)
    end
    it "can find its supplier" do
      expect(stock_item.supplier).to eq(supplier)
    end
    it "can find its order" do
      expect(stock_item.order).to eq(order)
    end
    it "can find who ordered this item" do
      expect(stock_item.sourcer).to eq(sourcer)
    end
  end
end
