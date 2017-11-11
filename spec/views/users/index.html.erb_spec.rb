require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :username => "Username",
        :full_name => "Full Name",
        :role => "Role"
      ),
      User.create!(
        :username => "Username",
        :full_name => "Full Name",
        :role => "Role"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    assert_select "tr>td", :text => "Full Name".to_s, :count => 2
    assert_select "tr>td", :text => "Role".to_s, :count => 2
  end
end
