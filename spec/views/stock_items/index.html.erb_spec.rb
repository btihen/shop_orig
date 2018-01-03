require 'rails_helper'

RSpec.describe "stock_items/index", type: :view do
  before(:each) do
    @stock_items = assign(:stock_items, [
                            FactoryBot.create(:stock_item, stock_item_status: 'available'),
                            FactoryBot.create(:stock_item, stock_item_status: 'sold'),
                          ])
  end

  it "renders a list of stock_items" do
    render
    assert_select "tr>td", :text => @stock_items[0].stock_item_status, :count => 1
    assert_select "tr>td", :text => @stock_items[1].stock_item_status, :count => 1
    assert_select "tr>td", :text => @stock_items[0].stock_item_sold_price.to_s, :count => 1
    assert_select "tr>td", :text => @stock_items[1].stock_item_sold_price.to_s, :count => 1
    assert_select "tr>td", :text => @stock_items[0].order_line.id.to_s, :count => 1
    assert_select "tr>td", :text => @stock_items[1].order_line.id.to_s, :count => 1
  end
end
