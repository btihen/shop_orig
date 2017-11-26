require 'rails_helper'

RSpec.describe "orders/edit", type: :view do
  before(:each) do
    @sourcer = assign(:user, User.create!(
      :username => "MyUsernane",
      :full_name => "MyName",
      :role => "MyRole"
    ))
    @order = assign(:order, Order.create!(
      :status => "MyString",
      :reason => "MyText",
      :sourcer => @sourcer
    ))
  end

  it "renders the edit order form" do
    render

    assert_select "form[action=?][method=?]", order_path(@order), "post" do

      assert_select "input[name=?]", "order[status]"

      assert_select "textarea[name=?]", "order[reason]"

      assert_select "input[name=?]", "order[user_id]"
    end
  end
end
