require 'rails_helper'

RSpec.describe Supplier, type: :model do

  let!(:supplier)         { FactoryBot.create(:supplier) }
  let(:duplicate_supplier){ FactoryBot.build(:supplier,
                                      supplier_name: supplier.supplier_name) }
  let(:invalid_supplier)  { FactoryBot.build(:invalid_supplier) }
  let(:product)           { FactoryBot.create(:product,
                                      supplier: supplier) }
  context "verify factory" do
    it "correctly builds supplier" do
      expect( supplier.valid? ).to be_truthy
      expect( supplier.errors.details).to eq( {} )
      expect( supplier.errors.messages).to eq( {} )
    end
    it "correctly detects duplicate_supplier" do
      expect( duplicate_supplier.valid? ).to be_falsey
      # expect( duplicate_supplier.errors.details[:supplier_name][0][:error]).to eq( :taken )
      expect( duplicate_supplier.errors.messages).to eq(
                                {:supplier_name=>["has already been taken"]} )
    end
    it "detects an invalid_supplier" do
      expect( invalid_supplier.valid? ).to be_falsey
      expect( invalid_supplier.errors.details).to eq(
                  {:supplier_name=>[{:error=>:blank},
                                    {:error=>:too_short, :count=>2}]})
      expect( invalid_supplier.errors.messages).to eq(
                  {:supplier_name=>["can't be blank",
                                    "is too short (minimum is 2 characters)"]})
    end
  end

  context "Check Supplier Relationships" do
    it "suppliers can find their associated product" do
      expect( supplier.products ).to eq( [product] )
    end

  end
end
