require 'rails_helper'

RSpec.describe "sale_lines/edit", type: :view do
  before(:each) do
    @sale_line = assign(:sale_line, FactoryBot.create(:sale_line) )
  end

  it "renders the edit sale_line form" do
    render

    assert_select "form[action=?][method=?]", sale_line_path(@sale_line), "post" do

      assert_select "textarea[name=?]", "sale_line[sale_line_note]"

      assert_select "input[name=?]", "sale_line[sale_price]"

      assert_select "input[name=?]", "sale_line[sale_id]"
    end
  end
end
