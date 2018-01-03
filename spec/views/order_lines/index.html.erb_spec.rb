require 'rails_helper'

RSpec.describe "order_lines/index", type: :view do
  before(:each) do
    @order_lines = assign(:order_lines, [
                            FactoryBot.create(:order_line, :order_line_quantity => 1),
                            FactoryBot.create(:order_line, :order_line_quantity => 2),
                          ])
  end

  it "renders a list of order_lines" do
    render
    assert_select "tr>td", :text => @order_lines[0].order_line_quantity.to_s, :count => 1
    assert_select "tr>td", :text => @order_lines[1].order_line_quantity.to_s, :count => 1
    assert_select "tr>td", :text => @order_lines[0].order_line_note.to_s, :count => 1
    assert_select "tr>td", :text => @order_lines[1].order_line_note.to_s, :count => 1
    assert_select "tr>td", :text => @order_lines[0].order_line_actual_purchase_price.to_s, :count => 1
    assert_select "tr>td", :text => @order_lines[1].order_line_actual_purchase_price.to_s, :count => 1
  end
end
