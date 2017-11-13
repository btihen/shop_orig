require 'rails_helper'

RSpec.describe "sales/new", type: :view do
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
    assign(:sale, Sale.new(
      :payment_method => "MyString",
      :register => @register
    ))
  end

  it "renders new sale form" do
    render

    assert_select "form[action=?][method=?]", sales_path, "post" do

      assert_select "input[name=?]", "sale[payment_method]"

      assert_select "input[name=?]", "sale[register_id]"
    end
  end
end
