require 'rails_helper'

RSpec.describe OrderItem, type: :model do

  let(:invalid_order_item) { FactoryBot.build(:invalid_order_item) }
  #
  let!(:sourcer)    { FactoryBot.create(:user ) }
  let!(:order)      { FactoryBot.create(:order,
                                        sourcer:    sourcer) }
  let!(:supplier)   { FactoryBot.create(:supplier) }
  let!(:product)    { FactoryBot.create(:product,
                                        supplier:   supplier) }
  let!(:order_item) { FactoryBot.create(:order_item,
                                        product:    product,
                                        order:      order) }
  let!(:stock_item) { FactoryBot.create(:stock_item,
                                        order_item: order_item) }
  context "verify factory" do
    it "correctly builds order_item" do
      expect( order_item.valid? ).to be_truthy
      expect( order_item.errors.details).to eq( {} )
      expect( order_item.errors.messages).to eq( {} )
    end
    it "correctly detects invalid_order_item" do
      expect( invalid_order_item.valid? ).to be_falsey
      # pp invalid_order_item.errors.messages
      # expect( invalid_order_item.errors.details ).to eq( {} )
      expect( invalid_order_item.errors.messages ).to eq(
              { order: ["must exist"],
                product: ["must exist"],
                item_purchase_price_cents: ["is not a number"],
                item_purchase_price_currency: ["is not included in the list"],
                quantity: ["is not a number"]
              } )
    end
  end

  context "Check Supplier Relationships" do
    it "Order Items can find their associated product" do
      expect( order_item.product ).to eq( product )
      expect( order_item.product.product_price ).to eq( product.product_price )
    end
    it "Order Items can find their associated supplier" do
      expect( order_item.supplier ).to eq( supplier )
    end
    it "Order Items can find their associated sourcer" do
      expect( order_item.sourcer ).to eq( sourcer )
    end
    it "can find which user stock_items this from this order_item" do
      expect( order_item.stock_items ).to eq( [stock_item] )
    end
  end

end
