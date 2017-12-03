require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    @users = assign(:users, [
      FactoryBot.create(:user, role: 'manager'),
      FactoryBot.create(:user, role: 'cashier'),
      # User.create!(
      #   :username => "Username0",
      #   :full_name => "Full Name0",
      #   :role => "Role0"
      # ),
      # User.create!(
      #   :username => "Username1",
      #   :full_name => "Full Name1",
      #   :role => "Role1"
      # )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => @users[0].username.to_s, :count => 1
    assert_select "tr>td", :text => @users[1].username.to_s, :count => 1
    assert_select "tr>td", :text => @users[0].full_name.to_s, :count => 1
    assert_select "tr>td", :text => @users[1].full_name.to_s, :count => 1
    assert_select "tr>td", :text => @users[0].role.to_s, :count => 1
    assert_select "tr>td", :text => @users[1].role.to_s, :count => 1
  end
end
