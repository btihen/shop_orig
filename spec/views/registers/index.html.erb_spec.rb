require 'rails_helper'

RSpec.describe "registers/index", type: :view do
  before(:each) do
    # @cashier = assign(:user, FactoryBot.create(:cashier) )
    @registers = assign(:registers, [
                          FactoryBot.create(:register),
                          FactoryBot.create(:register),
                        ])
  end

  it "renders a list of registers" do
    render
    assert_select "tr>td", :text => @registers[0].start_amount.to_s, :count => 1
    assert_select "tr>td", :text => @registers[0].close_amount.to_s, :count => 1
    assert_select "tr>td", :text => @registers[1].start_amount.to_s, :count => 1
    assert_select "tr>td", :text => @registers[1].close_amount.to_s, :count => 1
    assert_select "tr>td", :text => @registers[0].cashier.full_name.to_s, :count => 1
    assert_select "tr>td", :text => @registers[1].cashier.full_name.to_s, :count => 1
  end
end
