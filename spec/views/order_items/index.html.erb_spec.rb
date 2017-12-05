require 'rails_helper'

RSpec.describe "order_items/index", type: :view do
  before(:each) do
    @order_items = assign(:order_items, [
                            FactoryBot.create(:order_item, :quantity => 1),
                            FactoryBot.create(:order_item, :quantity => 2),
                          ])
  end

  it "renders a list of order_items" do
    render
    assert_select "tr>td", :text => @order_items[0].quantity.to_s, :count => 1
    assert_select "tr>td", :text => @order_items[1].quantity.to_s, :count => 1
    assert_select "tr>td", :text => @order_items[0].note.to_s, :count => 1
    assert_select "tr>td", :text => @order_items[1].note.to_s, :count => 1
    assert_select "tr>td", :text => @order_items[0].item_purchase_price.to_s, :count => 1
    assert_select "tr>td", :text => @order_items[1].item_purchase_price.to_s, :count => 1
  end
end
