require 'rails_helper'

RSpec.describe "tax_categories/show", type: :view do
  before(:each) do
    @tax_category = assign(:tax_category, FactoryBot.create(:tax_category) )
    # @tax_category = assign(:tax_category, TaxCategory.create!(
    #   :tax_category_name => "Tax Category Name",
    #   :tax_category_rate => "9.99"
    # ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{CGI.escapeHTML(@tax_category.tax_category_name)}/)
    expect(rendered).to match(/#{@tax_category.tax_category_rate}/)
  end
end
