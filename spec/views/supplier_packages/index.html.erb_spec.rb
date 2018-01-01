require 'rails_helper'

RSpec.describe "supplier_packages/index", type: :view do
  before(:each) do
    @supplier_packages = assign(:supplier_packages, [
                        FactoryBot.create(:supplier_package),
                        FactoryBot.create(:supplier_package),
                      ])
    # assign(:supplier_packages, [
    #   SupplierPackage.create!(
    #     :product => nil,
    #     :included_product => nil,
    #     :included_quantity => 2
    #   ),
    #   SupplierPackage.create!(
    #     :product => nil,
    #     :included_product => nil,
    #     :included_quantity => 2
    #   )
    # ])
  end

  it "renders a list of supplier_packages" do
    render
    assert_select "tr>td", :text => @supplier_packages[0].product.product_name.to_s, :count => 1
    assert_select "tr>td", :text => @supplier_packages[0].product.supplier.supplier_name.to_s, :count => 1
    assert_select "tr>td", :text => @supplier_packages[0].included_product.product_name.to_s.to_s, :count => 1
    assert_select "tr>td", :text => @supplier_packages[0].included_quantity.to_s, :count => 1
  end
end
