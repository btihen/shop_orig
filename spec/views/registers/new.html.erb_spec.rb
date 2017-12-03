require 'rails_helper'

RSpec.describe "registers/new", type: :view do
  before(:each) do
    @cashier = assign(:user, FactoryBot.create(:cashier) )
    assign(:register, Register.new(
      :start_amount => Money.new(10000, 'CHF'),
      :close_amount => Money.new(9000, 'CHF'),
      :cashier => @cashier
    ))
  end

  it "renders new register form" do
    render

    assert_select "form[action=?][method=?]", registers_path, "post" do

      assert_select "input[name=?]", "register[start_amount]"

      assert_select "input[name=?]", "register[close_amount]"

      assert_select "input[name=?]", "register[user_id]"
    end
  end
end
