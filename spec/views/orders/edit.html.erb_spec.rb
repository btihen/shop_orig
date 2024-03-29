require 'rails_helper'

RSpec.describe "orders/edit", type: :view do
  before(:each) do
    @order = assign( :order, FactoryBot.create(:order) )
  end

  it "renders the edit order form" do
    render

    assert_select "form[action=?][method=?]", order_path(@order), "post" do

      assert_select "input[name=?]", "order[order_status]"

      assert_select "textarea[name=?]", "order[order_reason]"

      assert_select "input[name=?]", "order[user_id]"
    end
  end
end
