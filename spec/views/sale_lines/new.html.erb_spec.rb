require 'rails_helper'

RSpec.describe "sale_lines/new", type: :view do
  before(:each) do
    assign( :sale_line, FactoryBot.build(:sale_line) )
  end

  it "renders new sale_line form" do
    render

    assert_select "form[action=?][method=?]", sale_lines_path, "post" do

      assert_select "textarea[name=?]", "sale_line[sale_line_note]"

      assert_select "input[name=?]", "sale_line[sale_line_sale_price]"

      assert_select "input[name=?]", "sale_line[sale_id]"
    end
  end
end
