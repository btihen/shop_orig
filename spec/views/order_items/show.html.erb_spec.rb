require 'rails_helper'

RSpec.describe "order_items/show", type: :view do
  before(:each) do
    @order_item = assign( :order_item, FactoryBot.create(:order_item,
                          order_item_note: "Helvetica pork belly tofu kombucha.") )
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@order_item.quantity}/)
    expect(rendered).to match(/#{CGI.escapeHTML(@order_item.order_item_note)}/)
    expect(rendered).to match(/#{@order_item.item_purchase_price}/)
  end
end
