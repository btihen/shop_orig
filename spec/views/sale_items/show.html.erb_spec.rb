require 'rails_helper'

RSpec.describe "sale_items/show", type: :view do
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
    @sale_item = assign(:sale_item, SaleItem.create!(
      :note => "MyText",
      :sale_price => Money.new(9000, 'CHF'),
      :sale => @sale
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@sale_item.note}/)
    expect(rendered).to match(/#{@sale_item.sale_price}/)
    expect(rendered).to match(/#{@sale_item.sale.id}/)
  end
end
