require 'rails_helper'

RSpec.describe "sales/index", type: :view do
  before(:each) do
    @sales = assign(:sales, [
                      FactoryBot.create(:cash_sale),
                      FactoryBot.create(:card_sale),
                    ])
  end

  it "renders a list of sales" do
    render
    assert_select "tr>td", :text => @sales[0].sale_payment_method, :count => 1
    assert_select "tr>td", :text => @sales[1].sale_payment_method, :count => 1
    assert_select "tr>td", :text => @sales[0].register.id.to_s, :count => 1
    assert_select "tr>td", :text => @sales[1].register.id.to_s, :count => 1
  end
end
