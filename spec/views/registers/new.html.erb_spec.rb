require 'rails_helper'

RSpec.describe "registers/new", type: :view do

  # let!(:register) { assign( :register, FactoryBot.create(:register) ) }
  before(:each) do
    assign(:register, FactoryBot.build(:register) )
  end

  it "renders new register form" do
    render

    assert_select "form[action=?][method=?]", registers_path, "post" do

      assert_select "input[name=?]", "register[start_amount]"

      assert_select "input[name=?]", "register[close_amount]"

      assert_select "input[name=?]", "register[user_id]"
    end
  end
end
