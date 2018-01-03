require 'rails_helper'

RSpec.describe "sale_lines/index", type: :view do
  before(:each) do
    @sale_lines = assign(:sale_lines, [
                          FactoryBot.create(:sale_line),
                          FactoryBot.create(:sale_line),
                        ])
  end

  it "renders a list of sale_lines" do
    render
    assert_select "tr>td", :text => @sale_lines[0].sale_line_note, :count => 1
    assert_select "tr>td", :text => @sale_lines[1].sale_line_note, :count => 1
    assert_select "tr>td", :text => @sale_lines[0].sale_line_sale_price.to_s, :count => 1
    assert_select "tr>td", :text => @sale_lines[1].sale_line_sale_price.to_s, :count => 1
    assert_select "tr>td", :text => @sale_lines[0].sale.id.to_s, :count => 1
    assert_select "tr>td", :text => @sale_lines[1].sale.id.to_s, :count => 1
  end
end
