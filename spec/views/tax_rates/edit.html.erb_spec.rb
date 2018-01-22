require 'rails_helper'

RSpec.describe "tax_rates/edit", type: :view do
  before(:each) do
    @tax_category = assign(:tax_category, FactoryBot.create(:tax_category) )
    @tax_rate     = assign(:tax_rate, FactoryBot.create(:tax_rate,
                                                tax_category: @tax_category) )
    # @tax_rate = assign(:tax_rate, TaxRate.create!(
    #   :tax_rate => "9.99",
    #   :tax_end_date => "MyString",
    #   :tax_category => nil
    # ))
  end

  it "renders the edit tax_rate form" do
    render

    assert_select "form[action=?][method=?]", tax_rate_path(@tax_rate), "post" do

      assert_select "input[name=?]", "tax_rate[tax_rate]"

      assert_select "input[name=?]", "tax_rate[tax_end_date]"

      assert_select "input[name=?]", "tax_rate[tax_category_id]"
    end
  end
end
