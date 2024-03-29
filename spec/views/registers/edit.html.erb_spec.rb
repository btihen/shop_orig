require 'rails_helper'

RSpec.describe "registers/edit", type: :view do
  before(:each) do
    @register = assign(:register, FactoryBot.create(:register) )
  end

  it "renders the edit register form" do
    render

    assert_select "form[action=?][method=?]", register_path(@register), "post" do

      assert_select "input[name=?]", "register[register_currency]"

      assert_select "input[name=?]", "register[register_start_amount]"

      assert_select "input[name=?]", "register[register_close_amount]"

      assert_select "input[name=?]", "register[register_cash_deposit]"

      assert_select "input[name=?]", "register[user_id]"
    end
  end
end
