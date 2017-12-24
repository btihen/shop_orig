require 'rails_helper'

RSpec.describe "sale_items/show", type: :view do
  before(:each) do
    @sale_item = assign(:sale_item, FactoryBot.create(:sale_item) )
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{CGI.escapeHTML(@sale_item.sale_item_note)}/)
    expect(rendered).to match(/#{@sale_item.sale_price}/)
    expect(rendered).to match(/#{@sale_item.sale.id}/)
  end
end
