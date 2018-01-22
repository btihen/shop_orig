require 'rails_helper'

RSpec.describe "tax_categories/show", type: :view do
  before(:each) do
    @tax_category = assign(:tax_category, FactoryBot.create(:tax_category) )
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{CGI.escapeHTML(@tax_category.tax_category_name)}/)
  end
end
