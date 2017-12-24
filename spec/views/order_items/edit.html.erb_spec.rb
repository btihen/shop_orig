require 'rails_helper'

RSpec.describe "order_items/edit", type: :view do
  before(:each) do
    @order_item = assign(:order_item, FactoryBot.create(:order_item) )
  end

  it "renders the edit order_item form" do
    render

    assert_select "form[action=?][method=?]", order_item_path(@order_item), "post" do

      assert_select "input[name=?]", "order_item[quantity]"

      assert_select "textarea[name=?]", "order_item[order_item_note]"

      assert_select "input[name=?]", "order_item[item_purchase_price]"
    end
  end
end
