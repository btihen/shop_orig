require 'rails_helper'

RSpec.describe "registers/index", type: :view do
  before(:each) do
    @registers = assign(:registers, [
                          FactoryBot.create(:register,
                                            register_start_amount: 34523,
                                            register_currency: 'CHF',
                                            register_close_amount: 98765,
                                            register_cash_deposit: 65495
                                           ),
                          FactoryBot.create(:register,
                                            register_start_amount: 24523,
                                            register_currency: 'EUR',
                                            register_close_amount: 87654,
                                            register_cash_deposit: 54321
                                           ),
                        ])
  end

  it "renders a list of registers" do
    render
    # pp view.inspect

    # expect(view).to render_template(:index)
    # expect(view).to render_template("index")
    # expect(view).to render_template("registers/index")

    # assert_select "tr>td", :text => @registers[0].register_currency, :count => 1
    assert_select "tr>td", :text => @registers[0].register_start_amount.to_s, :count => 1
    assert_select "tr>td", :text => @registers[0].register_close_amount.to_s, :count => 1
    assert_select "tr>td", :text => @registers[0].register_cash_deposit.to_s, :count => 1
    assert_select "tr>td", :text => @registers[0].cashier.user_real_name, :count => 1
    # assert_select "tr>td", :text => @registers[1].register_currency, :count => 1
    # assert_select "tr>td", :text => @registers[1].register_start_amount.to_s, :count => 1
    # assert_select "tr>td", :text => @registers[1].register_close_amount.to_s, :count => 1
    # assert_select "tr>td", :text => @registers[1].cashier.user_real_name, :count => 1
  end
end
