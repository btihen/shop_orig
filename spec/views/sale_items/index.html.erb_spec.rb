require 'rails_helper'

RSpec.describe "sale_items/index", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :username => "MyUsernane",
      :full_name => "MyName",
      :role => "MyRole"
    ))
    @register = assign(:register, Register.create!(
      :start_amount => Money.new(10000, 'CHF'),
      :close_amount => Money.new(9000, 'CHF'),
      :user => @user
    ))
    @sale = assign(:sale, Sale.create!(
      :payment_method => "MyString",
      :register => @register
    ))
    @sale_items = assign(:sale_items, [
      SaleItem.create!(
        :note => "MyText0",
        :sale_price => Money.new(10000, 'CHF'),
        :sale => @sale
      ),
      SaleItem.create!(
        :note => "MyText1",
        :sale_price => Money.new(9000, 'CHF'),
        :sale => @sale
      )
    ])
  end

  it "renders a list of sale_items" do
    render
    assert_select "tr>td", :text => @sale_items[0].note.to_s, :count => 1
    assert_select "tr>td", :text => @sale_items[1].note.to_s, :count => 1
    assert_select "tr>td", :text => @sale_items[0].sale_price.to_s, :count => 1
    assert_select "tr>td", :text => @sale_items[1].sale_price.to_s, :count => 1
    assert_select "tr>td", :text => @sale_items[0].sale.id.to_s, :count => 2
  end
end
