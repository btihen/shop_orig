require 'rails_helper'

RSpec.describe Register, type: :model do

  let(:register)              { FactoryBot.build(:register) }
  let(:open_nil_register)     { FactoryBot.build(:open_nil_register) }
  let(:open_empty_register)   { FactoryBot.build(:open_empty_register) }
  let(:invalid_register)      { FactoryBot.build(:invalid_register) }
  let(:invalid_neg_register)  { FactoryBot.build(:invalid_neg_register) }
  #
  let!(:supplier)   { FactoryBot.create(:supplier) }
  let!(:product)    { FactoryBot.create(:product,
                                        supplier:   supplier) }
  #
  let!(:sourcer)    { FactoryBot.create(:sourcer) }
  let!(:order)      { FactoryBot.create(:order,
                                        sourcer:    sourcer) }
  let!(:order_item) { FactoryBot.create(:order_item,
                                        product:    product,
                                        order:      order) }
  let!(:stock_item) { FactoryBot.create(:stock_item,
                                        order_item: order_item) }
  #
  let!(:cashier)    { FactoryBot.create(:cashier) }
  let!(:register)   { FactoryBot.create(:register,
                                        cashier:    cashier) }
  let!(:sale)       { FactoryBot.create(:sale,
                                        register:   register) }
  let!(:sale_item)  { FactoryBot.create(:sale_item,
                                        sale:       sale,
                                        stock_item: stock_item) }

  context "verify factory" do
    it "correctly builds register" do
      expect( register.valid? ).to be_truthy
      expect( register.errors.details).to eq( {} )
      expect( register.errors.messages).to eq( {} )
    end
    it "correctly open_nil_register" do
      expect( open_nil_register.valid? ).to be_truthy
      # puts "\nNEWLY OPENED REGISTER"
      # pp open_nil_register
      # puts "\nNEWLY OPENED REGISTER - PARAMS"
      # pp open_nil_register.errors.messages
      expect( open_nil_register.errors.details ).to eq( {} )
      expect( open_nil_register.errors.messages ).to eq( {} )
    end
    xit "correctly open_empty_register" do
      puts "\nNEWLY OPENED EMPTY REGISTER"
      pp open_empty_register
      puts "\nNEWLY OPENED EMPTY REGISTER - PARAMS"
      expect( open_empty_register.valid? ).to be_truthy
      pp open_empty_register.errors.messages
      expect( open_empty_register.errors.details ).to eq( {} )
      expect( open_empty_register.errors.messages ).to eq( {} )
    end
    it "correctly detects invalid_register" do
      expect( invalid_register.valid? ).to be_falsey
      # puts "\nINVALID REGISTER"
      # pp invalid_register
      # puts "\nINVALID PARAMS"
      # pp invalid_register.errors.messages
      expect( invalid_register.errors.messages ).to eq(
              { :cashier=>["must exist"],
                :start_amount_cents=>["is not a number"],
                :start_amount_currency=>["is not included in the list"]
              }
            )
    end
    it "correctly detects invalid_neg_register" do
      expect( invalid_neg_register.valid? ).to be_falsey
      # puts "\nINVALID NEG AMOUNT REGISTER"
      # pp invalid_neg_register
      # puts "\nINVALID NEG AMOUNT PARAMS"
      # pp invalid_neg_register.errors.messages
      expect( invalid_neg_register.errors.messages).to eq(
              { :close_amount_cents=>["must be greater than or equal to 0"],
                :close_amount_currency=>["is not included in the list"]
              }
            )
    end
  end

  context "find model relationships" do
    it "register to find its user" do
      expect( register.cashier ).to eq( cashier )
    end
    it "register to find its sales" do
      expect( register.sales ).to eq( [sale] )
    end
    it "register to find its sales_items" do
      expect( register.sale_items ).to eq( [sale_item] )
    end
    it "register to find its order_items" do
      expect( register.order_items ).to eq( [order_item] )
    end
    it "register to find its products_sold" do
      expect( register.products_sold ).to eq( [product] )
    end
  end

end
