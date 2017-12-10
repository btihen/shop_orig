require 'rails_helper'

RSpec.describe "suppliers/show", type: :view do
  before(:each) do
    @supplier = assign(:supplier, FactoryBot.create(:supplier) )
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{CGI.escapeHTML(@supplier.supplier_name)}/)
    expect(rendered).to match(/#{CGI.escapeHTML(@supplier.supplier_notes)}/)
  end
end
