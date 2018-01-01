require 'rails_helper'

RSpec.describe Sale, type: :model do

  let(:sale)        { FactoryBot.create(:sale) }
  let(:invalid_sale){ FactoryBot.build(:invalid_sale) }
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
    it "correctly builds sale" do
      expect( sale.valid? ).to be_truthy
      expect( sale.errors.details).to eq( {} )
      expect( sale.errors.messages).to eq( {} )
    end
    it "detects an invalid_stock_item" do
      expect( invalid_sale.valid? ).to be_falsey
      # expect( invalid_sale.errors.details[:payment_method][0][:error]).to eq( :inclusion )
      expect( invalid_sale.errors.messages).to eq(
                          { register: ["must exist"],
                            payment_method: ["is not included in the list"] } )
    end
  end

  context "model can find its relationships" do
    it "finds it's user" do
      expect( sale.cashier ).to eq( cashier )
    end
    it "finds it's register" do
      expect( sale.register ).to eq( register )
    end
    it "finds it's sales_items" do
      expect( sale.sale_lines ).to eq( [sale_line] )
    end
    it "finds it's stock_item" do
      expect( sale.stock_items ).to eq( [stock_item] )
    end
  end

end
