require 'rails_helper'

RSpec.describe "orders/index", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :username => "MyUsernane",
      :full_name => "MyName",
      :role => "MyRole"
    ))
    assign(:orders, [
      Order.create!(
        :status => "Status",
        :reason => "MyText",
        :user => @user
      ),
      Order.create!(
        :status => "Status",
        :reason => "MyText",
        :user => @user
      )
    ])
  end

  it "renders a list of orders" do
    render
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "#{@user.full_name}".to_s, :count => 2
  end
end
