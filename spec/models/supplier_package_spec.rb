require 'rails_helper'

RSpec.describe SupplierPackage, type: :model do

  let(:invalid_nil_package )  { FactoryBot.build(:invalid_nil_package) }
  let(:invalid_neg_package )  { FactoryBot.build(:invalid_neg_package) }
  let!(:supplier)             { FactoryBot.create(:supplier) }
  let!(:product )             { FactoryBot.create(:product,
                                          supplier: supplier) }
  let( :supplier_package )    { FactoryBot.create(:supplier_package,
                                          included_product: product) }
  context "verify factory" do
    it "correctly builds product" do
      expect( supplier_package.valid? ).to be_truthy
      expect( supplier_package.errors.details ).to eq( {} )
      expect( supplier_package.errors.messages ).to eq( {} )
    end
    it "correctly detects invalid_nil_package" do
      expect( invalid_nil_package.valid? ).to be_falsey
      # pp invalid_nil_package.errors.messages
      # expect( invalid_nil_package.errors.details ).to eq( {} )
      expect( invalid_nil_package.errors.messages ).to eq(
              { :product=>["must exist"],
                :included_product=>["must exist"],
                :included_quantity=>["is not a number"]
              }
            )
    end
    it "correctly detects invalid_neg_package" do
      expect( invalid_neg_package.valid? ).to be_falsey
      # pp invalid_neg_package.errors.messages
      # expect( invalid_neg_package.errors.details ).to eq( {} )
      expect( invalid_neg_package.errors.messages ).to eq(
              { :included_quantity=>["must be greater than 0"] }
            )
    end
  end

end
