require 'rails_helper'

RSpec.describe TaxRate, type: :model do

    let(:invalid_tax_rate)        { FactoryBot.build(:invalid_tax_rate) }
    let(:invalid_neg_tax_rate)    { FactoryBot.build(:invalid_neg_tax_rate) }
    let!(:tax_category)           { FactoryBot.create(:tax_category) }
    let!(:tax_rate)               { FactoryBot.create(:tax_rate,
                                                tax_category: tax_category) }
    let!(:product_category)       { FactoryBot.create(:product_category,
                                                tax_category: tax_category) }
    context "verify factory tax_rate" do
      it "correctly builds supplier" do
        expect( tax_rate.valid? ).to be_truthy
        expect( tax_rate.errors.details).to eq( {} )
        expect( tax_rate.errors.messages).to eq( {} )
      end
      it "detects an invalid_tax_rate" do
        expect( invalid_tax_rate.valid? ).to be_falsey
        # pp invalid_tax_rate.errors.messages
        expect( invalid_tax_rate.errors.messages).to eq(
                { tax_rate:          ["is not a number"],
                  tax_start_date:    ["is not a valid date"]
                } )
      end
      it "detects an invalid_neg_tax_rate" do
        expect( invalid_neg_tax_rate.valid? ).to be_falsey
        # pp invalid_neg_tax_rate.errors.messages
        expect( invalid_neg_tax_rate.errors.messages).to eq(
                { tax_rate: ["must be greater than or equal to 0"] }
              )
      end
    end

    context "Check Tax Rate Has a Category" do
      it "tax_rate can find associated tax_category" do
        expect( tax_rate.tax_category ).to eq( tax_category )
      end
    end
end
