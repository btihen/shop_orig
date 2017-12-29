require 'rails_helper'

RSpec.describe "products/new", type: :view do
  before(:each) do
    assign(:product, FactoryBot.build(:product) )
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do

      assert_select "input[name=?]", "product[product_name]"

      assert_select "textarea[name=?]", "product[product_description]"

      assert_select "input[name=?]", "product[product_purchase_price]"

      # TODO: test input of associated models
      # assert_select "input[name=?]", "product[supplier]"
    end
  end
end
