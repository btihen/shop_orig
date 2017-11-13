require 'rails_helper'

RSpec.describe "suppliers/show", type: :view do
  before(:each) do
    @supplier = assign(:supplier, Supplier.create!(
      :supplier_name => "Supplier Name",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@supplier.supplier_name}/)
    expect(rendered).to match(/#{@supplier.description}/)
  end
end
