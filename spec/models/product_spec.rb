require 'rails_helper'

RSpec.describe Product, type: :model do

  let!(:supplier) { FactoryBot.create(:supplier ) }
  let( :product ) { FactoryBot.create(:product,
                                      supplier: supplier) }

  context "verify factory" do
    it "correctly builds product" do
      expect( product.valid? ).to be_truthy
      expect( product.errors.details).to eq( {} )
      expect( product.errors.messages).to eq( {} )
    end
  end

  context "Check Supplier Relationships" do
    it "products can find their associated suppliers" do
      expect( product.supplier ).to eq( supplier )
    end
  end

end
