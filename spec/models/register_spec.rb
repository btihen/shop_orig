require 'rails_helper'

RSpec.describe Register, type: :model do

  let(:register)              { FactoryBot.create(:register) }
  let(:open_register_closed_nil)  { FactoryBot.build(:open_register_closed_nil) }
  let(:open_register_closed_blank){ FactoryBot.build(:open_register_closed_blank) }
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
  let!(:order_line) { FactoryBot.create(:order_line,
                                        product:    product,
                                        order:      order) }
  let!(:stock_item) { FactoryBot.create(:stock_item,
                                        order_line: order_line) }
  #
  let!(:cashier)    { FactoryBot.create(:cashier) }
  let!(:register)   { FactoryBot.create(:register,
                                        cashier:    cashier) }
  let!(:sale)       { FactoryBot.create(:sale,
                                        register:   register) }
  let!(:sale_line)  { FactoryBot.create(:sale_line,
                                        sale:       sale,
                                        stock_item: stock_item) }

  context "verify factory" do
    it "correctly builds register" do
      expect( register.valid? ).to be_truthy
      expect( register.errors.details).to eq( {} )
      expect( register.errors.messages).to eq( {} )
    end
    it "correctly open_nil_register" do
      expect( open_register_closed_nil.valid? ).to be_truthy
      # puts "\nNEWLY OPENED REGISTER"
      # pp open_register_closed_nil
      # puts "\nNEWLY OPENED REGISTER - PARAMS"
      # pp open_register_closed_nil.errors.messages
      expect( open_register_closed_nil.errors.details ).to eq( {} )
      expect( open_register_closed_nil.errors.messages ).to eq( {} )
    end
    it "correctly open_empty_register" do
      puts "\nNEWLY OPENED EMPTY REGISTER"
      # pp open_register_closed_blank
      puts "\nNEWLY OPENED EMPTY REGISTER - PARAMS"
      expect( open_register_closed_blank.valid? ).to be_truthy
      # pp open_register_closed_blank.errors.messages
      expect( open_register_closed_blank.errors.details ).to eq( {} )
      expect( open_register_closed_blank.errors.messages ).to eq( {} )
    end
    it "correctly detects invalid_register" do
      expect( invalid_register.valid? ).to be_falsey
      # puts "\nINVALID REGISTER"
      # pp invalid_register
      # puts "\nINVALID PARAMS"
      # pp invalid_register.errors.messages
      expect( invalid_register.errors.messages ).to eq(
              { :cashier=>["must exist"],
                :register_currency=>["can't be blank", "is not included in the list"],
                :start_amount_cents=>["is not a number"] #,
                # :start_amount_currency=>["is not included in the list"]
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
              { :close_amount_cents=>["must be greater than or equal to 0"] #,
                # :close_amount_currency=>["is not included in the list"]
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
      expect( register.sale_lines ).to eq( [sale_line] )
    end
    it "register to find its order_lines" do
      expect( register.order_lines ).to eq( [order_line] )
    end
    it "register to find its products_sold" do
      expect( register.products_sold ).to eq( [product] )
    end
  end

end
