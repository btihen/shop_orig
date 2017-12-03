require 'rails_helper'

RSpec.describe "sales/new", type: :view do
  before(:each) do
    @cashier = assign(:user, FactoryBot.create(:cashier) )
    @register = assign(:register, Register.create!(
      :start_amount => Money.new(10000, 'CHF'),
      :close_amount => Money.new(9000, 'CHF'),
      :cashier => @cashier
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
