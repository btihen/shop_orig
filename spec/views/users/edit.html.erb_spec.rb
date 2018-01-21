require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign( :user, FactoryBot.create(:user) )
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input[name=?]", "user[user_login]"

      assert_select "input[name=?]", "user[user_name]"

      assert_select "input[name=?]", "user[user_role]"
    end
  end
end
