require 'rails_helper'

RSpec.describe ProductCategory, type: :model do

  let(:invalid_product_category ) { FactoryBot.build(:invalid_product_category) }
  let!(:tax_category)             { FactoryBot.create(:tax_category ) }
  let( :product_category )        { FactoryBot.create(:product_category,
                                    tax_category: tax_category) }
  let!(:duplicate_product_category) { FactoryBot.build(:product_category,
                                    product_category_name: product_category.product_category_name) }
  #
  context "verify factory" do
    it "correctly builds product category" do
      expect( product_category.valid? ).to be_truthy
      expect( product_category.errors.details).to eq( {} )
      expect( product_category.errors.messages).to eq( {} )
    end
    it "detects an invalid_product_category" do
      expect( invalid_product_category.valid? ).to be_falsey
      expect( invalid_product_category.errors.messages).to eq(
              { product_category_name: ["can't be blank",
                                    "is too short (minimum is 2 characters)"],
                tax_category: ["must exist"]
              } )
    end
    it "correctly detects duplicate_product_category" do
      expect( duplicate_product_category.valid? ).to be_falsey
      expect( duplicate_product_category.errors.messages).to eq(
              {:product_category_name=>["has already been taken"]} )
    end
  end

  context "Check Product Category Has Relationships" do
    it "product_category can find associated tax_category" do
      expect( product_category.tax_category ).to eq( tax_category )
    end
  end

end
