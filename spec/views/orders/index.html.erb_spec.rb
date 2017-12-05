require 'rails_helper'

RSpec.describe "orders/index", type: :view do
  before(:each) do
    @orders = assign(:orders, [
                      FactoryBot.create(:order, status: 'available'),
                      FactoryBot.create(:order, status: 'sold'),
                    ])
  end

  it "renders a list of orders" do
    render
    assert_select "tr>td", :text => @orders[0].status, :count => 1
    assert_select "tr>td", :text => @orders[1].status, :count => 1
    assert_select "tr>td", :text => @orders[0].reason, :count => 1
    assert_select "tr>td", :text => @orders[1].reason, :count => 1
    assert_select "tr>td", :text => @orders[0].sourcer.full_name, :count => 1
    assert_select "tr>td", :text => @orders[1].sourcer.full_name, :count => 1
  end
end
