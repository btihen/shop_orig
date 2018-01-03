require 'rails_helper'

RSpec.describe "registers/new", type: :view do

  before(:each) do
    assign(:register, FactoryBot.build(:register) )
  end

  it "renders new register form" do
    render

    assert_select "form[action=?][method=?]", registers_path, "post" do

      assert_select "input[name=?]", "register[register_start_amount]"

      assert_select "input[name=?]", "register[register_close_amount]"

      assert_select "input[name=?]", "register[register_cash_deposit]"

      assert_select "input[name=?]", "register[user_id]"
    end
  end
end
