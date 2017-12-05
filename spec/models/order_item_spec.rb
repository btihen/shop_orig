require 'rails_helper'

RSpec.describe OrderItem, type: :model do

    let!(:sourcer)    { FactoryBot.create(:user ) }
    let!(:order)      { FactoryBot.create(:order,
                                          sourcer:    sourcer) }
    let!(:supplier)   { FactoryBot.create(:supplier) }
    let!(:product)    { FactoryBot.create(:product,
                                          supplier:   supplier) }
    let!(:order_item) { FactoryBot.create(:order_item,
                                          product:    product,
                                          order:      order) }
    let(:stock_item)  { FactoryBot.create(:stock_item,
                                          order_item: order_item) }
    context "verify factory" do
      it "correctly builds order_item" do
        expect( order_item.valid? ).to be_truthy
        expect( order_item.errors.details).to eq( {} )
        expect( order_item.errors.messages).to eq( {} )
      end
    end

    context "Check Supplier Relationships" do
      it "Order Items can find their associated product" do
        expect( order_item.product ).to eq( product )
      end
      it "Order Items can find their associated supplier" do
        expect( order_item.supplier ).to eq( supplier )
      end
      it "can find which user stock_items this from this order_item" do
        expect( order_item.stock_items ).to eq( [stock_item] )
      end
    end

end
