require 'rails_helper'

RSpec.describe "product_categories/edit", type: :view do
  before(:each) do
    @product_category = assign(:product_category, FactoryBot.create(:product_category) )
    # @product_category = assign(:product_category, ProductCategory.create!(
    #   :product_category_name => "MyString",
    #   :tax_category => nil
    # ))
  end

  it "renders the edit product_category form" do
    render

    assert_select "form[action=?][method=?]", product_category_path(@product_category), "post" do

      assert_select "input[name=?]", "product_category[product_category_name]"

      assert_select "input[name=?]", "product_category[tax_category_id]"
    end
  end
end
