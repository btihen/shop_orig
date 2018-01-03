require 'rails_helper'

RSpec.describe "registers/show", type: :view do
  before(:each) do
    @register = assign(:register, FactoryBot.create(:register) )
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@register.register_start_amount}/)
    expect(rendered).to match(/#{@register.register_close_amount}/)
    expect(rendered).to match(/#{@register.register_cash_deposit}/)
    expect(rendered).to match(/#{CGI.escapeHTML(@register.cashier.user_real_name)}/)
  end
end
