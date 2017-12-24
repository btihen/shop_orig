require 'rails_helper'

RSpec.describe "product_categories/show", type: :view do
  before(:each) do
    @product_category = assign(:product_category, FactoryBot.create(:product_category) )
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{CGI.escapeHTML(@product_category.product_category_name)}/)
    expect(rendered).to match(/#{CGI.escapeHTML(@product_category.tax_category.tax_category_name)}/)
  end
end
