require 'rails_helper'

RSpec.describe "tax_categories/index", type: :view do
  before(:each) do
    @tax_categories = assign(:tax_categories, [
                            FactoryBot.create(:tax_category),
                            FactoryBot.create(:tax_category),
                          ])
  end

  it "renders a list of tax_categories" do
    render
    assert_select "tr>td", :text => @tax_categories[0].tax_category_name.to_s, :count => 1
    # assert_select "tr>td", :text => @tax_categories[0].tax_category_info.to_s, :count => 1
  end
end
