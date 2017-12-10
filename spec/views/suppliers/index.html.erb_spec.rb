require 'rails_helper'

RSpec.describe "suppliers/index", type: :view do
  before(:each) do
    @suppliers = assign(:suppliers, [
                          FactoryBot.create(:supplier),
                          FactoryBot.create(:supplier),
                        ])
  end

  it "renders a list of suppliers" do
    render
    assert_select "tr>td", :text => @suppliers[0].supplier_name, :count => 1
    assert_select "tr>td", :text => @suppliers[1].supplier_name, :count => 1
    assert_select "tr>td", :text => @suppliers[0].supplier_notes, :count => 1
    assert_select "tr>td", :text => @suppliers[1].supplier_notes, :count => 1
    # assert_select "tr>td", :text => @suppliers[0].currency.to_s, :count => 1
    # assert_select "tr>td", :text => @suppliers[1].currency.to_s, :count => 1
  end
end
