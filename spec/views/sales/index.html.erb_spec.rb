require 'rails_helper'

RSpec.describe "sales/index", type: :view do
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
    @sales = assign(:sales, [
      Sale.create!(
        :payment_method => "MyString0",
        :register => @register
      ),
      Sale.create!(
        :payment_method => "MyString1",
        :register => @register
      )
    ])
  end

  it "renders a list of sales" do
    render
    assert_select "tr>td", :text => @sales[0].payment_method.to_s, :count => 1
    assert_select "tr>td", :text => @sales[1].payment_method.to_s, :count => 1
    assert_select "tr>td", :text => @sales[0].register.id.to_s, :count => 2
  end
end
