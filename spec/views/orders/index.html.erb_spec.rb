require 'rails_helper'

RSpec.describe "orders/index", type: :view do
  before(:each) do
    @sourcer = assign( :user, FactoryBot.create(:sourcer) )
    @orders = assign(:orders, [
      Order.create!(
        :status => "Status0",
        :reason => "MyText0",
        :sourcer => @sourcer
      ),
      Order.create!(
        :status => "Status1",
        :reason => "MyText1",
        :sourcer => @sourcer
      )
    ])
  end

  it "renders a list of orders" do
    render
    assert_select "tr>td", :text => @orders[0].status.to_s, :count => 1
    assert_select "tr>td", :text => @orders[1].status.to_s, :count => 1
    assert_select "tr>td", :text => @orders[0].reason.to_s, :count => 1
    assert_select "tr>td", :text => @orders[1].reason.to_s, :count => 1
    assert_select "tr>td", :text => @orders[0].sourcer.full_name.to_s, :count => 2
  end
end
