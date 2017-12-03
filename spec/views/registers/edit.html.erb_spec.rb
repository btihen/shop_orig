require 'rails_helper'

RSpec.describe "registers/edit", type: :view do
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
  end

  it "renders the edit register form" do
    render

    assert_select "form[action=?][method=?]", register_path(@register), "post" do

      assert_select "input[name=?]", "register[start_amount]"

      assert_select "input[name=?]", "register[close_amount]"

      assert_select "input[name=?]", "register[user_id]"
    end
  end
end
