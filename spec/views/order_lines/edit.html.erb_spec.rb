require 'rails_helper'

RSpec.describe "order_lines/edit", type: :view do
  before(:each) do
    @order_line = assign(:order_line, FactoryBot.create(:order_line) )
  end

  it "renders the edit order_line form" do
    render

    assert_select "form[action=?][method=?]", order_line_path(@order_line), "post" do

      assert_select "input[name=?]", "order_line[order_line_quantity]"

      assert_select "textarea[name=?]", "order_line[order_line_note]"

      assert_select "input[name=?]", "order_line[order_line_actual_purchase_price]"
    end
  end
end
