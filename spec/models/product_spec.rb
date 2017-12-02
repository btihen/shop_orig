require 'rails_helper'

RSpec.describe Product, type: :model do

  let!(:supplier) { FactoryBot.build(:supplier ) }
  let( :product ) { FactoryBot.build(:product,
                                      supplier: supplier) }

  context "verify factory" do
    it "correctly builds product" do
      expect( product.valid? ).to be_truthy
      # expect( product[:errors]).to eq( nil )
    end
  end

  context "Check Supplier Relationships" do
    it "products can find their associated suppliers" do
      expect( product.supplier ).to eq( supplier )
    end
  end

end
