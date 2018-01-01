require 'rails_helper'

RSpec.describe "supplier_packages/edit", type: :view do
  before(:each) do
    @supplier_package = assign(:supplier_package, FactoryBot.create(:supplier_package) )
    # @supplier_package = assign(:supplier_package, SupplierPackage.create!(
    #   :product => nil,
    #   :included_product => nil,
    #   :included_quantity => 1
    # ))
  end

  it "renders the edit supplier_package form" do
    render

    assert_select "form[action=?][method=?]", supplier_package_path(@supplier_package), "post" do

      assert_select "input[name=?]", "supplier_package[product_id]"

      assert_select "input[name=?]", "supplier_package[included_product_id]"

      assert_select "input[name=?]", "supplier_package[included_quantity]"
    end
  end
end
