require 'rails_helper'

RSpec.describe Product, type: :model do

  let(:invalid_product ) { FactoryBot.build(:invalid_product) }
  let!(:supplier)        { FactoryBot.create(:supplier,
                                              supplier_currency: 'EUR' ) }
  let!(:tax_category)    { FactoryBot.create(:tax_category ) }
  let!(:product_category){ FactoryBot.create(:product_category,
                                              tax_category: tax_category) }
  let!( :product )       { FactoryBot.create(:product,
                                              supplier: supplier,
                                              product_category: product_category) }

  context "verify factory" do
    it "correctly builds product" do
      # puts "TEST SUPPLIER DETAILS"
      # pp supplier.inspect
      # puts "TEST PRODUCT DETAILS"
      # pp product.inspect
      expect( product.valid? ).to be_truthy
      # puts "TEST VALID PRODUCT ERRORS"
      # pp product.errors
      expect( product.errors.details ).to eq( {} )
      expect( product.errors.messages ).to eq( {} )
    end
    it "correctly detects invalid_product" do
      expect( invalid_product.valid? ).to be_falsey
      # puts "INVALID ERROR MESSAGES"
      # pp invalid_product.errors.messages
      # expect( invalid_product.errors.details ).to eq( {} )
      expect( invalid_product.errors.messages ).to eq(
              { supplier: ["must exist"],
                product_name:    ["can't be blank",
                                  "is too short (minimum is 2 characters)"],
                product_supplier_price_cents: ["is not a number"],
                product_supplier_price_currency: ["is not included in the list"],
                product_resell_item_price_cents: ["must be greater than or equal to 0"],
              }
            )
    end
  end

  context "Check Supplier Relationships" do
    it "products can find their associated suppliers" do
      expect( product.supplier ).to eq( supplier )
    end
    it "products can find their associated purchase currency" do
      expect( product.supplier.supplier_currency ).to eq( 'EUR' )
    end
    it "products can find their product_supplier_price.currency" do
      expect( product.product_supplier_price.currency ).to eq( 'EUR' )
    end
    it "products can find their purchase_price currency" do
      expect( product.product_supplier_price_currency ).to eq( 'EUR' )
    end
    it "products can find their associated Product Category" do
      expect( product.product_category ).to eq( product_category )
    end
    it "products can find their associated Tax Category" do
      expect( product.product_category.tax_category ).to eq( tax_category )
    end
  end

end
