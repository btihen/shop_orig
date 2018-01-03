require 'rails_helper'

RSpec.describe "order_lines/show", type: :view do
  before(:each) do
    @order_line = assign( :order_line, FactoryBot.create(:order_line,
                          order_line_note: "Helvetica pork belly tofu kombucha.") )
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@order_line.order_line_quantity}/)
    expect(rendered).to match(/#{CGI.escapeHTML(@order_line.order_line_note)}/)
    expect(rendered).to match(/#{@order_line.order_line_actual_purchase_price}/)
  end
end
