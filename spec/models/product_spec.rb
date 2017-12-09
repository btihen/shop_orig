require 'rails_helper'

RSpec.describe Product, type: :model do

  let(:invalid_product ) { FactoryBot.build(:invalid_product) }
  let!(:supplier)        { FactoryBot.create(:supplier ) }
  let( :product )        { FactoryBot.build(:product,
                                            supplier: supplier) }

  context "verify factory" do
    it "correctly builds product" do
      expect( product.valid? ).to be_truthy
      expect( product.errors.details ).to eq( {} )
      expect( product.errors.messages ).to eq( {} )
    end
    it "correctly detects invalid_product" do
      expect( invalid_product.valid? ).to be_falsey
      # pp invalid_product.errors.messages
      # expect( invalid_product.errors.details ).to eq( {} )
      expect( invalid_product.errors.messages ).to eq(
              { :supplier=>["must exist"],
                :product_price_cents=>["is not a number"],
                :product_price_currency=>["is not included in the list"],
                :product_name=>["can't be blank",
                                "is too short (minimum is 2 characters)"]
              } )
    end
  end

  context "Check Supplier Relationships" do
    it "products can find their associated suppliers" do
      expect( product.supplier ).to eq( supplier )
    end
  end

end
