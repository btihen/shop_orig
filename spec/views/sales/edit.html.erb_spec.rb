require 'rails_helper'

RSpec.describe "sales/edit", type: :view do
  before(:each) do
    @sale = assign(:sale, FactoryBot.create(:sale) )
  end

  it "renders the edit sale form" do
    render

    assert_select "form[action=?][method=?]", sale_path(@sale), "post" do

      assert_select "input[name=?]", "sale[payment_method]"

      assert_select "input[name=?]", "sale[register_id]"
    end
  end
end
