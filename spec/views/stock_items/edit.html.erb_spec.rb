require 'rails_helper'

RSpec.describe "stock_items/edit", type: :view do
  before(:each) do
    @stock_item = assign(:stock_item, FactoryBot.create(:stock_item) )
  end

  it "renders the edit stock_item form" do
    render

    assert_select "form[action=?][method=?]", stock_item_path(@stock_item), "post" do

      assert_select "input[name=?]", "stock_item[status]"

      assert_select "input[name=?]", "stock_item[sell_price]"

      assert_select "input[name=?]", "stock_item[order_line_id]"
    end
  end
end
