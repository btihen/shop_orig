require 'rails_helper'

RSpec.describe "orders/show", type: :view do
  before(:each) do
    @order = assign( :order, FactoryBot.create(:order) )
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@order.status}/)
    expect(rendered).to match(/#{CGI.escapeHTML(@order.reason)}/)
    expect(rendered).to match(/#{CGI.escapeHTML(@order.sourcer.full_name)}/)
  end
end
