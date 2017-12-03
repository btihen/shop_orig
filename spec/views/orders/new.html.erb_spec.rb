require 'rails_helper'

RSpec.describe "orders/new", type: :view do
  before(:each) do
    @sourcer = assign( :user, FactoryBot.create(:sourcer) )
    # @sourcer = assign(:user, User.create!(
    #   :username => "MyUsernane",
    #   :full_name => "MyName",
    #   :role => "MyRole"
    # ))
    assign(:order, Order.new(
      :status => "MyString",
      :reason => "MyText",
      :sourcer => @sourcer
    ))
  end

  it "renders new order form" do
    render

    assert_select "form[action=?][method=?]", orders_path, "post" do

      assert_select "input[name=?]", "order[status]"

      assert_select "textarea[name=?]", "order[reason]"

      assert_select "input[name=?]", "order[user_id]"
    end
  end
end
