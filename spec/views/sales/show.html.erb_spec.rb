require 'rails_helper'

RSpec.describe "sales/show", type: :view do
  before(:each) do
    @sale = assign(:sale, FactoryBot.create(:sale) )
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@sale.payment_method}/)
    expect(rendered).to match(/#{@sale.register.id}/)
  end
end
