require 'rails_helper'

RSpec.describe Order, type: :model do

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
    it "correctly builds order" do
      expect( order.valid? ).to be_truthy
      # expect( order[:errors]).to eq( nil )
    end
  end

  context "test relationships" do
    it "order to find its user" do
      expect( order.sourcer ).to eq( sourcer )
    end
    it "order to find its ordered-items" do
      expect( order.order_items ).to eq( [order_item] )
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
