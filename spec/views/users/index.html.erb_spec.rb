require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    @users = assign(:users, [
                      FactoryBot.create(:user, role: 'manager'),
                      FactoryBot.create(:user, full_name: "O'Connel",
                                                role: 'cashier'),
                    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => @users[0].username, :count => 1
    assert_select "tr>td", :text => @users[1].username, :count => 1
    assert_select "tr>td", :text => @users[0].full_name, :count => 1
    assert_select "tr>td", :text => @users[1].full_name, :count => 1
    assert_select "tr>td", :text => @users[0].role, :count => 1
    assert_select "tr>td", :text => @users[1].role, :count => 1
  end
end
