require 'rails_helper'

RSpec.describe Register, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  before(:each) do
    @user = User.create!(
      :username => "MyUsernane",
      :full_name => "MyName",
      :role => "MyRole"
    )
    @register = Register.create!(
      :start_amount => Money.new(10000, 'CHF'),
      :close_amount => Money.new(9000, 'CHF'),
      :user => @user
    )
    @sale = Sale.create!(
      :payment_method => "MyString",
      :register => @register
    )
    @sale_item = SaleItem.create!(
      :note => "MyText",
      :sale_price => Money.new(9000, 'CHF'),
      :sale => @sale
    )
  end

  context "find model relationships" do
    it "register to find its user" do
      expect( @register.user ).to eq( @user )
    end
    it "register to find its sales" do
      expect( @register.sales ).to eq( [@sale] )
    end
    it "register to find its sales_items" do
      expect( @register.sale_items ).to eq( [@sale_item] )
    end
  end

end
