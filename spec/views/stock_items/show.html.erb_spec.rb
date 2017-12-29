require 'rails_helper'

RSpec.describe "stock_items/show", type: :view do
  before(:each) do
    @stock_item = assign(:stock_item, FactoryBot.create(:stock_item) )
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@stock_item.status}/)
    expect(rendered).to match(/#{@stock_item.sell_price}/)
    expect(rendered).to match(/#{@stock_item.order_line.id}/)
  end
end
