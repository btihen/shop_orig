require 'rails_helper'

RSpec.describe "orders/index", type: :view do
  before(:each) do
    @orders = assign(:orders, [
                      FactoryBot.create(:order, order_status: 'approved'),
                      FactoryBot.create(:order, order_status: 'paid'),
                    ])
  end

  it "renders a list of orders" do
    render
    assert_select "tr>td", :text => @orders[0].order_status, :count => 1
    assert_select "tr>td", :text => @orders[1].order_status, :count => 1
    assert_select "tr>td", :text => @orders[0].order_reason, :count => 1
    assert_select "tr>td", :text => @orders[1].order_reason, :count => 1
    assert_select "tr>td", :text => @orders[0].sourcer.full_name, :count => 1
    assert_select "tr>td", :text => @orders[1].sourcer.full_name, :count => 1
  end
end
