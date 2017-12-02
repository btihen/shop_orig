require 'rails_helper'

RSpec.describe Supplier, type: :model do

  let!(:supplier) { FactoryBot.create(:supplier) }
  let(:product)   { FactoryBot.create(:product,
                                      supplier: supplier) }
  context "verify factory" do
    it "correctly builds supplier" do
      expect( supplier.valid? ).to be_truthy
      # expect( supplier[:errors]).to eq( nil )
    end
  end

  context "Check Supplier Relationships" do
    it "suppliers can find their associated product" do
      expect( supplier.products ).to eq( [product] )
    end

  end
end
