require 'rails_helper'

RSpec.describe "registers/new", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :username => "MyUsernane",
      :full_name => "MyName",
      :role => "MyRole"
    ))
    assign(:register, Register.new(
      :start_amount => Money.new(10000, 'CHF'),
      :close_amount => Money.new(9000, 'CHF'),
      :user => @user
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
