require 'test_helper'

class UserCanLogInTest < ActionDispatch::IntegrationTest
  test "user can log in" do
    user = User.create(username: "brennan", password: "password")

    visit '/login'
    fill_in "Username", with: "brennan"
    fill_in "Password", with: "password"
    click_on "login"

    assert page.has_content?("Welcome, #{user.username}")

  end
end
