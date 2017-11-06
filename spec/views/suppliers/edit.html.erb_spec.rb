require 'rails_helper'

RSpec.describe "suppliers/edit", type: :view do
  before(:each) do
    @supplier = assign(:supplier, Supplier.create!(
      :supplier_name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit supplier form" do
    render

    assert_select "form[action=?][method=?]", supplier_path(@supplier), "post" do

      assert_select "input[name=?]", "supplier[supplier_name]"

      assert_select "textarea[name=?]", "supplier[description]"
    end
  end
end
