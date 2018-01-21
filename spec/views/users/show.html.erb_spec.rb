require 'rails_helper'

RSpec.describe "users/show", type: :view do

  before(:each) do
    # @user = assign(:user, FactoryBot.create(:user) )
    @user = assign(:user, FactoryBot.create(:user, user_name: "O'Connor") )
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@user.user_login}/)
    expect(rendered).to match(/#{CGI.escapeHTML(@user.user_name)}/)
    expect(rendered).to match(/#{@user.user_role}/)
  end
end
