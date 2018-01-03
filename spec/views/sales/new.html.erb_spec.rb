require 'rails_helper'

RSpec.describe "sales/new", type: :view do
  before(:each) do
    assign(:sale, FactoryBot.build(:sale) )
  end

  it "renders new sale form" do
    render

    assert_select "form[action=?][method=?]", sales_path, "post" do

      assert_select "input[name=?]", "sale[sale_payment_method]"

      assert_select "input[name=?]", "sale[register_id]"
    end
  end
end
