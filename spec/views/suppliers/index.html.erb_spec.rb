require 'rails_helper'

RSpec.describe "suppliers/index", type: :view do
  before(:each) do
    assign(:suppliers, [
      Supplier.create!(
        :supplier_name => "Supplier Name",
        :description => "MyText"
      ),
      Supplier.create!(
        :supplier_name => "Supplier Name",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of suppliers" do
    render
    assert_select "tr>td", :text => "Supplier Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
