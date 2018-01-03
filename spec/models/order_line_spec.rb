require 'rails_helper'

RSpec.describe OrderLine, type: :model do

  let(:invalid_order_line) { FactoryBot.build(:invalid_order_line) }
  #
  let!(:sourcer)    { FactoryBot.create(:user ) }
  let!(:order)      { FactoryBot.create(:order,
                                        sourcer:    sourcer) }
  let!(:supplier)   { FactoryBot.create(:supplier) }
  let!(:product)    { FactoryBot.create(:product,
                                        supplier:   supplier) }
  let!(:bulk_product){ FactoryBot.create(:product,
                                        supplier:   supplier) }
  let!(:package)    { FactoryBot.create(:supplier_package,
                                        product: bulk_product,
                                        included_product: product) }
  let!(:order_line) { FactoryBot.create(:order_line,
                                        product:    product,
                                        order:      order) }
  let!(:order_line_2){ FactoryBot.create(:order_line,
                                        product:    bulk_product,
                                        order:      order) }
  let!(:stock_item) { FactoryBot.create(:stock_item,
                                        order_line: order_line) }
  context "verify factory" do
    it "correctly builds order_line" do
      expect( order_line.valid? ).to be_truthy
      expect( order_line.errors.details).to eq( {} )
      expect( order_line.errors.messages).to eq( {} )
    end
    it "correctly detects invalid_order_line" do
      expect( invalid_order_line.valid? ).to be_falsey
      # pp invalid_order_line.errors.messages
      # expect( invalid_order_line.errors.details ).to eq( {} )
      expect( invalid_order_line.errors.messages ).to eq(
              { order: ["must exist"],
                product: ["must exist"],
                order_line_actual_purchase_price_cents: ["is not a number"],
                order_line_actual_purchase_price_currency: ["is not included in the list"],
                order_line_quantity: ["is not a number"]
              } )
    end
  end

  context "Check Supplier Relationships" do
    it "Order Items can find their associated product" do
      expect( order_line.product ).to eq( product )
      expect( order_line.product.product_supplier_price ).to eq( product.product_supplier_price )
    end
    it "Order Items can find their associated supplier" do
      expect( order_line.supplier ).to eq( supplier )
    end
    it "Order Items can find their associated sourcer" do
      expect( order_line.sourcer ).to eq( sourcer )
    end
    it "can find which user stock_items this from this order_line" do
      expect( order_line.stock_items ).to eq( [stock_item] )
    end
  end

end
