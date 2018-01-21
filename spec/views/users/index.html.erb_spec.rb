require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    @users = assign(:users, [
                      FactoryBot.create(:user, user_role: 'finance'),
                      FactoryBot.create(:user, user_name: "O'Connel",
                                                user_role: 'cashier'),
                    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => @users[0].user_login, :count => 1
    assert_select "tr>td", :text => @users[1].user_login, :count => 1
    assert_select "tr>td", :text => @users[0].user_name, :count => 1
    assert_select "tr>td", :text => @users[1].user_name, :count => 1
    assert_select "tr>td", :text => @users[0].user_role, :count => 1
    assert_select "tr>td", :text => @users[1].user_role, :count => 1
  end
end
