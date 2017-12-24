require 'rails_helper'

RSpec.describe "sale_items/new", type: :view do
  before(:each) do
    assign( :sale_item, FactoryBot.build(:sale_item) )
  end

  it "renders new sale_item form" do
    render

    assert_select "form[action=?][method=?]", sale_items_path, "post" do

      assert_select "textarea[name=?]", "sale_item[sale_item_note]"

      assert_select "input[name=?]", "sale_item[sale_price]"

      assert_select "input[name=?]", "sale_item[sale_id]"
    end
  end
end
