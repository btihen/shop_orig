require 'rails_helper'

RSpec.describe "product_categories/new", type: :view do
  before(:each) do
    assign(:product_category, ProductCategory.new(
      :product_category_name => "MyString",
      :tax_category => nil
    ))
  end

  it "renders new product_category form" do
    render

    assert_select "form[action=?][method=?]", product_categories_path, "post" do

      assert_select "input[name=?]", "product_category[product_category_name]"

      assert_select "input[name=?]", "product_category[tax_category_id]"
    end
  end
end
