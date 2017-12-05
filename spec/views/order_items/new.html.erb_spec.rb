require 'rails_helper'

RSpec.describe "order_items/new", type: :view do
  before(:each) do
    @order_item = assign( :order_item, FactoryBot.build(:order_item) )
  end

  it "renders new order_item form" do
    render

    assert_select "form[action=?][method=?]", order_items_path, "post" do

      assert_select "input[name=?]", "order_item[quantity]"

      assert_select "textarea[name=?]", "order_item[note]"

      assert_select "input[name=?]", "order_item[item_purchase_price]"
    end
  end
end
