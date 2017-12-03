require 'rails_helper'

RSpec.describe "users/show", type: :view do
  
  before(:each) do
    @user = assign(:user, FactoryBot.create(:user) )
    # @user = assign(:user, User.create!(
    #   :username => "Username",
    #   :full_name => "Full Name",
    #   :role => "Role"
    # ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{@user.username}/)
    expect(rendered).to match(/#{@user.full_name}/)
    expect(rendered).to match(/#{@user.role}/)
  end
end
