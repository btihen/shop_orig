require 'rails_helper'

RSpec.describe "tax_rates/new", type: :view do
  before(:each) do
    assign(:tax_rate, FactoryBot.build(:tax_rate) )
    # assign(:tax_rate, TaxRate.new(
    #   :tax_rate => "9.99",
    #   :tax_end_date => "MyString",
    #   :tax_category => nil
    # ))
  end

  it "renders new tax_rate form" do
    render

    assert_select "form[action=?][method=?]", tax_rates_path, "post" do

      assert_select "input[name=?]", "tax_rate[tax_rate]"

      assert_select "input[name=?]", "tax_rate[tax_end_date]"

      assert_select "input[name=?]", "tax_rate[tax_category_id]"
    end
  end
end
