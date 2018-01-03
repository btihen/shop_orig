require 'rails_helper'

RSpec.describe SaleLine, type: :model do

  let(:sale_line)         { FactoryBot.create(:sale_line) }
  let(:invalid_nil_sale_line) { FactoryBot.build(:invalid_nil_sale_line) }
  let(:invalid_neg_sale_line) { FactoryBot.build(:invalid_neg_sale_line) }
  #
  let!(:supplier)   { FactoryBot.create(:supplier) }
  let!(:product)    { FactoryBot.create(:product,
                                        supplier:   supplier) }
  #
  let!(:sourcer)    { FactoryBot.create(:user) }
  let!(:order)      { FactoryBot.create(:order,
                                        sourcer:    sourcer) }
  let!(:order_line) { FactoryBot.create(:order_line,
                                        product:    product,
                                        order:      order) }
  let!(:stock_item) { FactoryBot.create(:stock_item,
                                        order_line: order_line) }
  #
  let!(:cashier)    { FactoryBot.create(:user) }
  let!(:register)   { FactoryBot.create(:register,
                                        cashier:    cashier) }
  let!(:sale)       { FactoryBot.create(:sale,
                                        register:   register) }
  let!(:sale_line)  { FactoryBot.create(:sale_line,
                                        sale:       sale,
                                        stock_item: stock_item) }

  context "verify factory" do
    it "correctly builds sale_line" do
      expect( sale_line.valid? ).to be_truthy
      expect( sale_line.errors.details).to eq( {} )
      expect( sale_line.errors.messages).to eq( {} )
    end
    it "correctly detects invalid_nil_sale_line" do
      expect( invalid_nil_sale_line.valid? ).to be_falsey
      # puts "\nINVALID NIL PRICE SALE ITEM"
      # pp invalid_nil_sale_line.errors.messages
      expect( invalid_nil_sale_line.errors.messages ).to eq(
              { :sale=>["must exist"],
                :stock_item=>["must exist"],
                :sale_line_quantity=>["is not a number"],
                :sale_line_sale_price_cents=>["is not a number", "is not a number"],
                # :sale_line_sale_price_currency=>["is not included in the list"]
              }
            )
    end
    it "correctly detects invalid_neg_sale_line" do
      expect( invalid_neg_sale_line.valid? ).to be_falsey
      # puts "\nINVALID NEG PRICE SALE ITEM"
      # pp invalid_neg_sale_line.errors.messages
      expect( invalid_neg_sale_line.errors.messages ).to eq(
              { :sale=>["must exist"],
                :stock_item=>["must exist"],
                :sale_line_quantity=>["must be greater than or equal to 1"],
                :sale_line_sale_price_cents=>["must be greater than or equal to 0"],
                # :sale_line_sale_price_currency=>["is not included in the list"]
              }
            )
    end
  end

  context "test sale_line relationships" do
    it "can find it's user" do
      expect(sale_line.cashier).to eq( cashier )
    end
    it "can find its register" do
      expect(sale_line.register).to eq( register )
    end
    it "can find its sale" do
      expect(sale_line.sale).to eq( sale )
    end
    it "can find its stock_item" do
      expect(sale_line.stock_item).to eq( stock_item )
    end
    it "can find its order_line" do
      expect(sale_line.order_line).to eq( order_line )
    end
    it "can find its product" do
      expect(sale_line.product).to eq( product )
    end
    it "can find its supplier" do
      expect(sale_line.supplier).to eq( supplier )
    end
    it "can find its order" do
      expect(sale_line.order).to eq( order )
    end
    it "can find its sourcer" do
      expect(sale_line.sourcer).to eq( sourcer )
    end
  end

end
