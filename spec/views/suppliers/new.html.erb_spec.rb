require 'rails_helper'

RSpec.describe "suppliers/new", type: :view do
  before(:each) do
    assign(:supplier, FactoryBot.build(:supplier) )
  end

  it "renders new supplier form" do
    render

    assert_select "form[action=?][method=?]", suppliers_path, "post" do

      assert_select "input[name=?]", "supplier[supplier_name]"

      assert_select "textarea[name=?]", "supplier[supplier_notes]"
    end
  end
end
