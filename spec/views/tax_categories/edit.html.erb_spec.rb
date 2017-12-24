require 'rails_helper'

RSpec.describe "tax_categories/edit", type: :view do
  before(:each) do
    @tax_category = assign(:tax_category, FactoryBot.create(:tax_category) )
  end

  it "renders the edit tax_category form" do
    render

    assert_select "form[action=?][method=?]", tax_category_path(@tax_category), "post" do

      assert_select "input[name=?]", "tax_category[tax_category_name]"

      assert_select "input[name=?]", "tax_category[tax_category_rate]"
    end
  end
end
