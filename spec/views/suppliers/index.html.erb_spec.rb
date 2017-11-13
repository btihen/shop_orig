require 'rails_helper'

RSpec.describe "suppliers/index", type: :view do
  before(:each) do
    @suppliers = assign(:suppliers, [
      Supplier.create!(
        :supplier_name => "Supplier Name0",
        :description => "MyText0"
      ),
      Supplier.create!(
        :supplier_name => "Supplier Name1",
        :description => "MyText1"
      )
    ])
  end

  it "renders a list of suppliers" do
    render
    assert_select "tr>td", :text => @suppliers[0].supplier_name.to_s, :count => 1
    assert_select "tr>td", :text => @suppliers[1].supplier_name.to_s, :count => 1
    assert_select "tr>td", :text => @suppliers[0].description.to_s, :count => 1
    assert_select "tr>td", :text => @suppliers[1].description.to_s, :count => 1
    # assert_select "tr>td", :text => @suppliers[0].currency.to_s, :count => 1
    # assert_select "tr>td", :text => @suppliers[1].currency.to_s, :count => 1
  end
end
