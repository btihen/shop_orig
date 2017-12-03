require 'rails_helper'

RSpec.describe "sales/show", type: :view do
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

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@sale.payment_method}/)
    expect(rendered).to match(/#{@sale.register.id}/)
  end
end
