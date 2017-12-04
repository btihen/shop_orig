require 'rails_helper'

RSpec.describe "registers/show", type: :view do
  before(:each) do
    # @cashier = assign(:user, FactoryBot.create(:cashier) )
    # @register = assign(:register, Register.create!(
    #   :start_amount => Money.new(10000, 'CHF'),
    #   :close_amount => Money.new(9000, 'CHF'),
    #   :cashier => @cashier
    # ))
    @register = assign(:register, FactoryBot.create(:register) )
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@register.start_amount}/)
    expect(rendered).to match(/#{@register.close_amount}/)
    expect(rendered).to match(/#{@register.cashier.full_name}/)
  end
end
