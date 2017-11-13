require 'rails_helper'

RSpec.describe "sale_items/edit", type: :view do
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

  it "renders the edit sale_item form" do
    render

    assert_select "form[action=?][method=?]", sale_item_path(@sale_item), "post" do

      assert_select "textarea[name=?]", "sale_item[note]"

      assert_select "input[name=?]", "sale_item[sale_price]"

      assert_select "input[name=?]", "sale_item[sale_id]"
    end
  end
end
