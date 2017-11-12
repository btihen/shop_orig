require 'rails_helper'

RSpec.describe Supplier, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  context "Check Supplier Relationships" do
    before(:each) do
      @supplier = Supplier.create!(
          :supplier_name => "MySupplier",
          :description => "MyText"
        )
      @product = Product.create!(
        :product_name => "MyProduct",
        :description => "MyText",
        :product_price => Money.new(10000, 'CHF'),
        :product_currency => "MyString",
        :supplier => @supplier
      )
    end
    it "suppliers can find their associated product" do
      expect( @supplier.products ).to eq([@product])
    end

  end
end
