require 'rails_helper'

RSpec.describe "sales/edit", type: :view do
  before(:each) do
    @cashier = assign(:user, FactoryBot.create(:cashier) )
    # @cashier = assign(:user, User.create!(
    #   :username => "MyUsernane",
    #   :full_name => "MyName",
    #   :role => "MyRole"
    # ))
    @register = assign(:register, Register.create!(
      :start_amount => Money.new(10000, 'CHF'),
      :close_amount => Money.new(9000, 'CHF'),
      :cashier => @cashier
    ))
    @sale = assign(:sale, Sale.create!(
      :payment_method => "MyString",
      :register => @register
    ))
  end

  it "renders the edit sale form" do
    render

    assert_select "form[action=?][method=?]", sale_path(@sale), "post" do

      assert_select "input[name=?]", "sale[payment_method]"

      assert_select "input[name=?]", "sale[register_id]"
    end
  end
end
