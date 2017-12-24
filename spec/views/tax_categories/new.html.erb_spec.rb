require 'rails_helper'

RSpec.describe "tax_categories/new", type: :view do
  before(:each) do
    assign(:tax_category, FactoryBot.build(:tax_category) )
    # assign(:tax_category, TaxCategory.new(
    #   :tax_category_name => "MyString",
    #   :tax_category_rate => "9.99"
    # ))
  end

  it "renders new tax_category form" do
    render

    assert_select "form[action=?][method=?]", tax_categories_path, "post" do

      assert_select "input[name=?]", "tax_category[tax_category_name]"

      assert_select "input[name=?]", "tax_category[tax_category_rate]"
    end
  end
end
