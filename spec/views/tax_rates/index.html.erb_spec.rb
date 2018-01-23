require 'rails_helper'

RSpec.describe "tax_rates/index", type: :view do
  before(:each) do
    @tax_category = assign(:tax_categories, FactoryBot.create(:tax_category))
    @tax_rates    = assign(:tax_rates, [
                            FactoryBot.create(:tax_rate,
                                        tax_category: @tax_category),
                            FactoryBot.create(:tax_rate,
                                        tax_category: @tax_category),
                          ])
  end

  it "renders a list of tax_rates" do
    render
    assert_select "tr>td", :text => @tax_rates[0].tax_rate.to_s, :count => 1
    assert_select "tr>td", :text => @tax_rates[0].tax_start_date.to_s, :count => 1
    assert_select "tr>td", :text => @tax_rates[0].tax_end_date.to_s, :count => 1
  end
end
