require 'rails_helper'

RSpec.describe "supplier_packages/new", type: :view do
  before(:each) do
    assign(:supplier_package, FactoryBot.build(:supplier_package) )
    # assign(:supplier_package, SupplierPackage.new(
    #   :product => nil,
    #   :included_product => nil,
    #   :included_quantity => 1
    # ))
  end

  it "renders new supplier_package form" do
    render

    assert_select "form[action=?][method=?]", supplier_packages_path, "post" do

      assert_select "input[name=?]", "supplier_package[product_id]"

      assert_select "input[name=?]", "supplier_package[included_product_id]"

      assert_select "input[name=?]", "supplier_package[included_quantity]"
    end
  end
end
