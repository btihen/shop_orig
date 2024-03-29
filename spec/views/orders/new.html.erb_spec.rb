require 'rails_helper'

RSpec.describe "orders/new", type: :view do
  before(:each) do
    assign(:order, FactoryBot.build(:order) )
  end

  it "renders new order form" do
    render

    assert_select "form[action=?][method=?]", orders_path, "post" do

      assert_select "input[name=?]", "order[order_status]"

      assert_select "textarea[name=?]", "order[order_reason]"

      assert_select "input[name=?]", "order[user_id]"
    end
  end
end
