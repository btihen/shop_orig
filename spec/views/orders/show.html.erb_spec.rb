require 'rails_helper'

RSpec.describe "orders/show", type: :view do
  before(:each) do
    @sourcer = assign( :user, FactoryBot.create(:sourcer) )
    @order = assign(:order, Order.create!(
      :status => "Status",
      :reason => "MyText",
      :sourcer => @sourcer
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@order.status}/)
    expect(rendered).to match(/#{@order.reason}/)
    expect(rendered).to match(/#{@order.sourcer.full_name}/)
  end
end
