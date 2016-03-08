require 'test_helper'

class UserCanRegisterTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "new user sees name on dashboard" do
    # as an ungresitered user
    # I visit the root path or main page
    visit '/'
    # and I click on the register now button
    click_on "register"
    # and I fill in the username with brennan
    fill_in "Username", with: "brennan"
    # and i fill in the password with password
    fill_in "Password", with: "password"
    # and i click the create account button
    click_button "Create Account"

    # I see my user account page
    user = User.last
    expected = "/users/#{user.id}"

    assert_equal expected, current_path
    assert page.has_content?("Welcome, #{user.username}")
  end
end
