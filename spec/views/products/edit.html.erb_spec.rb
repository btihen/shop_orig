require 'rails_helper'

RSpec.describe "products/edit", type: :view do
  before(:each) do
    @product = assign(:product, FactoryBot.create(:product) )
  end

  it "renders the edit product form" do
    render

    assert_select "form[action=?][method=?]", product_path(@product), "post" do

      assert_select "input[name=?]", "product[product_name]"

      assert_select "textarea[name=?]", "product[product_extra_info]"

      # this has to be edited on supplier page
      # assert_select "input[name=?]", "product[supplier.supplier_currency]"
    end
  end
end
