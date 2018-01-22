require 'rails_helper'

RSpec.describe "tax_rates/show", type: :view do
  before(:each) do
    @tax_rate = assign(:tax_rate, FactoryBot.create(:tax_rate) )
    # @tax_rate = assign(:tax_rate, TaxRate.create!(
    #   :tax_rate => "9.99",
    #   :tax_end_date => "Tax Rate End Date",
    #   :tax_category => nil
    # ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@tax_rate.tax_rate}/)
    expect(rendered).to match(/#{@tax_rate.tax_start_date}/)
    expect(rendered).to match(/#{@tax_rate.tax_end_date}/)
  end
end
