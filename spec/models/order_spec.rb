require 'rails_helper'

RSpec.describe Order, type: :model do

  let(:invalid_order) { FactoryBot.build(:invalid_order) }
  #
  let!(:sourcer)      { FactoryBot.create(:user) }
  let!(:order)        { FactoryBot.create(:order,
                                          sourcer:    sourcer) }
  let!(:supplier)     { FactoryBot.create(:supplier) }
  let!(:product)      { FactoryBot.create(:product,
                                          supplier:   supplier) }
  let!(:order_line)   { FactoryBot.create(:order_line,
                                          product:    product,
                                          order:      order) }
  let(:stock_item)    { FactoryBot.create(:stock_item,
                                          order_line: order_line) }

  context "verify factory" do
    it "correctly builds order" do
      expect( order.valid? ).to be_truthy
      expect( order.errors.details).to eq( {} )
      expect( order.errors.messages).to eq( {} )
    end
    it "correctly detect invalid_order" do
      expect( invalid_order.valid? ).to be_falsey
      # pp invalid_order.errors.messages
      # expect( invalid_order.errors.details).to eq( {} )
      expect( invalid_order.errors.messages).to eq(
              { sourcer: ["must exist"],
                order_status:  ["can't be blank", "is not included in the list"]
              } )
    end
  end

  context "test relationships" do
    it "order to find its user" do
      expect( order.sourcer ).to eq( sourcer )
    end
    it "order to find its ordered-items" do
      expect( order.order_lines ).to eq( [order_line] )
    end
    it "order to find its products ordered" do
      expect( order.products ).to eq( [product] )
    end
    it "order to find its supplier prociding products" do
      expect( order.supplier ).to eq( [supplier] )
    end
    it "order knows it stock_items" do
      expect( order.stock_items ).to eq( [stock_item] )
    end
  end


end
