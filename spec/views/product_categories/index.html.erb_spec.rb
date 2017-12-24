require 'rails_helper'

RSpec.describe "product_categories/index", type: :view do
  before(:each) do
    @product_categories = assign(:product_categories, [
                            FactoryBot.create(:product_category),
                            FactoryBot.create(:product_category),
                          ])
  end

  it "renders a list of product_categories" do
    render
    assert_select "tr>td", :text => @product_categories[0].product_category_name.to_s, :count => 1
    # assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
