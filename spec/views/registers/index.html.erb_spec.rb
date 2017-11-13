require 'rails_helper'

RSpec.describe "registers/index", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :username => "MyUsernane",
      :full_name => "MyName",
      :role => "MyRole"
    ))
    @registers = assign(:registers, [
      Register.create!(
        :open_amount => Money.new(10000, 'CHF'),
        :close_amount => Money.new(9000, 'CHF'),
        :user => @user
      ),
      Register.create!(
        :open_amount => Money.new(110000, 'CHF'),
        :close_amount => Money.new(19000, 'CHF'),
        :user => @user
      )
    ])
  end

  it "renders a list of registers" do
    render
    assert_select "tr>td", :text => @registers[0].open_amount.to_s, :count => 1
    assert_select "tr>td", :text => @registers[0].close_amount.to_s, :count => 1
    assert_select "tr>td", :text => @registers[1].open_amount.to_s, :count => 1
    assert_select "tr>td", :text => @registers[1].close_amount.to_s, :count => 1
    assert_select "tr>td", :text => @registers[0].user.full_name.to_s, :count => 2
  end
end
