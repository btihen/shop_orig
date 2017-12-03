require 'rails_helper'

RSpec.describe "sale_items/edit", type: :view do
  before(:each) do
    @sale_item = assign(:sale_item, FactoryBot.create(:sale_item) )
  end

  it "renders the edit sale_item form" do
    render

    assert_select "form[action=?][method=?]", sale_item_path(@sale_item), "post" do

      assert_select "textarea[name=?]", "sale_item[note]"

      assert_select "input[name=?]", "sale_item[sale_price]"

      assert_select "input[name=?]", "sale_item[sale_id]"
    end
  end
end
