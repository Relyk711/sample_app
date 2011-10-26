require 'spec_helper'

describe "FriendlyForwardings" do
  
  it "should forward to the requested page after sign in" do
    user = Factory(:user)
    visit edit_user_path(user)
  # The test automatically follows the redirect to the signin page.
    fill_in :email,     :with => user.email
    fill_in :password,  :with => user.password
    click_button
  # This test follows the redirect again this time to users/edit
    response.should render_template('users/edit')
    visit signout_path
    visit signin_path
  # redirect to users/show
    fill_in :email,     :with => user.email
    fill_in :password,  :with => user.password
    click_button
    response.should render_template('users/show')
  end
end