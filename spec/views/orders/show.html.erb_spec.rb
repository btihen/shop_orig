require 'rails_helper'

RSpec.describe "orders/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :username => "MyUsernane",
      :full_name => "MyName",
      :role => "MyRole"
    ))
    @order = assign(:order, Order.create!(
      :status => "Status",
      :reason => "MyText",
      :user => @user
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/MyText/)
    # expect(rendered).to match(//)
  end
end
