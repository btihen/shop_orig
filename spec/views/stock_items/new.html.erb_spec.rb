require 'rails_helper'

RSpec.describe "stock_items/new", type: :view do
  before(:each) do
    assign(:stock_item, FactoryBot.build(:stock_item) )
  end

  it "renders new stock_item form" do
    render

    assert_select "form[action=?][method=?]", stock_items_path, "post" do

      assert_select "input[name=?]", "stock_item[status]"

      assert_select "input[name=?]", "stock_item[sell_price]"

      assert_select "input[name=?]", "stock_item[order_item_id]"
    end
  end
end
