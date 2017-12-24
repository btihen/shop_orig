require 'rails_helper'

RSpec.describe "sale_items/index", type: :view do
  before(:each) do
    @sale_items = assign(:sale_items, [
                          FactoryBot.create(:sale_item),
                          FactoryBot.create(:sale_item),
                        ])
  end

  it "renders a list of sale_items" do
    render
    assert_select "tr>td", :text => @sale_items[0].sale_item_note, :count => 1
    assert_select "tr>td", :text => @sale_items[1].sale_item_note, :count => 1
    assert_select "tr>td", :text => @sale_items[0].sale_price.to_s, :count => 1
    assert_select "tr>td", :text => @sale_items[1].sale_price.to_s, :count => 1
    assert_select "tr>td", :text => @sale_items[0].sale.id.to_s, :count => 1
    assert_select "tr>td", :text => @sale_items[1].sale.id.to_s, :count => 1
  end
end
