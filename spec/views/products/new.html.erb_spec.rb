require 'rails_helper'

RSpec.describe "products/new", type: :view do
  before(:each) do
    assign(:product, FactoryBot.build(:product) )
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do

      assert_select "input[name=?]", "product[product_name]"

      assert_select "textarea[name=?]", "product[product_added_info]"

      assert_select "input[name=?]", "product[product_supplier_price]"

      assert_select "input[name=?]", "product[product_resell_item_price]"

      # TODO: test input of associated models
      # assert_select "input[name=?]", "product[supplier]"
    end
  end
end
