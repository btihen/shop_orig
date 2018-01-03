require 'rails_helper'

RSpec.describe "sale_lines/show", type: :view do
  before(:each) do
    @sale_line = assign(:sale_line, FactoryBot.create(:sale_line) )
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{CGI.escapeHTML(@sale_line.sale_line_note)}/)
    expect(rendered).to match(/#{@sale_line.sale_line_sale_price}/)
    expect(rendered).to match(/#{@sale_line.sale.id}/)
  end
end
