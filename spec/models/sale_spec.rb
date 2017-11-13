require 'rails_helper'

RSpec.describe Sale, type: :model do
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

  context "model can find its relationships" do
    it "finds it's user" do
      expect( @sale.user ).to eq( @user )
    end
    it "finds it's register" do
      expect( @sale.register ).to eq( @register )
    end
    it "finds it's sales_items" do
      expect( @sale.sale_items ).to eq( [@sale_item] )
    end
  end

end
