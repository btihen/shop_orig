require 'rails_helper'

RSpec.describe User, type: :model do

  let!(:user)         { FactoryBot.create(:user) }
  let(:duplicate_user){ FactoryBot.build(:user,
                                          username:   user.username) }
  let(:invalid_user)  { FactoryBot.build(:invalid_user) }
  #
  let!(:supplier)     { FactoryBot.create(:supplier) }
  let!(:product1)     { FactoryBot.create(:product,
                                          supplier:   supplier) }
  let!(:product2)     { FactoryBot.create(:product,
                                          supplier:   supplier) }
  #
  let!(:sourcer)      { FactoryBot.create(:user) }
  let!(:order1)       { FactoryBot.create(:order,
                                          sourcer:    sourcer) }
  let!(:order2)       { FactoryBot.create(:order,
                                          sourcer:    sourcer) }
  let!(:order_line1)  { FactoryBot.create(:order_line,
                                          product:    product1,
                                          order:      order1) }
  let!(:order_line2)  { FactoryBot.create(:order_line,
                                          product:    product2,
                                          order:      order2) }
  let!(:stock_item1)  { FactoryBot.create(:stock_item,
                                          order_line: order_line1) }
  let!(:stock_item2)  { FactoryBot.create(:stock_item,
                                          order_line: order_line2) }
  #
  let!(:cashier)      { FactoryBot.create(:user) }
  let!(:register)     { FactoryBot.create(:register,
                                          cashier:    cashier) }
  let!(:sale)         { FactoryBot.create(:sale,
                                          register:   register) }
  let!(:sale_line)    { FactoryBot.create(:sale_line,
                                          sale:       sale,
                                          stock_item: stock_item2) }

  context "verify factory" do
    it "correctly builds user" do
      expect( user.valid? ).to be_truthy
      expect( user.errors.details).to eq( {} )
      expect( user.errors.messages).to eq( {} )
    end
    it "correctly detects duplicate_user" do
      expect( duplicate_user.valid? ).to be_falsey
      # expect( duplicate_user.errors.details[:username][0][:error]).to eq( :taken )
      expect( duplicate_user.errors.messages).to eq(
                            {:username=>["has already been taken"]} )
    end
    it "correctly builds an invalid user" do
      expect( invalid_user.valid? ).to be_falsey
      # expect( invalid_user.valid? ).not_to be_truthy
      expect( invalid_user.errors.details[:username]).to eq(
              [{:error=>:blank}, {:error=>:too_short, :count=>2}] )
      expect( invalid_user.errors.details[:full_name]).to eq(
              [{:error=>:too_short, :count=>2}] )
      expect( invalid_user.errors.details[:role]).to eq(
              [{:error=>:blank}, {:error=>:inclusion, :value=>nil}] )
      expect( invalid_user.errors.messages[:username]).to eq(
              ["can't be blank", "is too short (minimum is 2 characters)"] )
      expect( invalid_user.errors.messages[:full_name]).to eq(
              ["is too short (minimum is 2 characters)"] )
      expect( invalid_user.errors.messages[:role]).to eq(
              ["can't be blank", "is not included in the list"] )
    end
  end

  context "test relationships" do
    it "sourcer can find its orders" do
      expect(sourcer.orders).to eq( [order1, order2] )
    end
    it "sourcer can find its order_lines" do
      expect(sourcer.order_lines).to eq( [order_line1, order_line2] )
    end
    it "sourcer can find its products_ordered" do
      expect(sourcer.products_ordered).to eq( [product1, product2] )
    end
    #
    it "cashier can find its registers" do
      expect(cashier.registers).to eq( [register] )
    end
    it "cashier can find its sales" do
      expect(cashier.sales).to eq( [sale] )
    end
    it "cashier can find its sales_items" do
      expect(cashier.sale_lines).to eq( [sale_line] )
    end
    it "cashier can find its sold_stock_items" do
      expect(cashier.stock_items).to eq( [stock_item2] )
    end
    it "cashier can find its sold_order_lines" do
      expect(cashier.sold_order_lines).to eq( [order_line2] )
    end
    it "cashier can find its products_sold" do
      expect(cashier.products_sold).to eq( [product2] )
    end
  end

end
