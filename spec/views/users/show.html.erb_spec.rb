require 'rails_helper'

RSpec.describe "users/show", type: :view do

  before(:each) do
    # @user = assign(:user, FactoryBot.create(:user) )
    @user = assign(:user, FactoryBot.create(:user, user_real_name: "O'Connor") )
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@user.username}/)
    expect(rendered).to match(/#{CGI.escapeHTML(@user.user_real_name)}/)
    expect(rendered).to match(/#{@user.user_role}/)
  end
end
