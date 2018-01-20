require 'rails_helper'

RSpec.describe "orders/show", type: :view do
  before(:each) do
    @order = assign( :order, FactoryBot.create(:order) )
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@order.order_status}/)
    expect(rendered).to match(/#{CGI.escapeHTML(@order.order_reason)}/)
    expect(rendered).to match(/#{CGI.escapeHTML(@order.sourcer.user_full_name)}/)
  end
end
