require 'rails_helper'

RSpec.describe TaxCategory, type: :model do

  let(:invalid_tax_category)    { FactoryBot.build(:invalid_tax_category) }
  let(:invalid_neg_tax_rate)    { FactoryBot.build(:invalid_tax_category) }
  let!(:tax_category)           { FactoryBot.create(:tax_category) }
  let!(:duplicate_tax_category) { FactoryBot.build(:tax_category,
                                            tax_category_name: tax_category.tax_category_name) }
  let!(:product_category)       { FactoryBot.create(:product_category,
                                            tax_category: tax_category) }
  context "verify factory" do
    it "correctly builds supplier" do
      expect( tax_category.valid? ).to be_truthy
      expect( tax_category.errors.details).to eq( {} )
      expect( tax_category.errors.messages).to eq( {} )
    end
    it "correctly detects tax_category" do
      expect( duplicate_tax_category.valid? ).to be_falsey
      # expect( duplicate_supplier.errors.details[:supplier_name][0][:error]).to eq( :taken )
      expect( duplicate_tax_category.errors.messages).to eq(
      {:tax_category_name=>["has already been taken"]} )
      end
    it "detects an invalid_tax_category" do
      expect( invalid_tax_category.valid? ).to be_falsey
      # pp invalid_tax_category.errors.messages
      # expect( invalid_supplier.errors.details).to eq(
      #             {:supplier_name=>[{:error=>:blank},
      #                               {:error=>:too_short, :count=>2}]})
      expect( invalid_tax_category.errors.messages).to eq(
      { tax_category_name: ["can't be blank", "is too short (minimum is 2 characters)"],
         tax_category_rate: ["is not a number"],
         tax_start_date:    ["is not a valid date"]
      } )
    end
  end

  context "Check Tax Category Has Relationships" do
    it "tax_category can find associated product_categories" do
      expect( tax_category.product_categories ).to eq( [product_category] )
    end
  end

end
