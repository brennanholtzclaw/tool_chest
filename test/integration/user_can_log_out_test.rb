require 'test_helper'

class UserCanLogOutTest < ActionDispatch::IntegrationTest
  test "user sees thanks for visiting message" do
    user = User.create(username: "brennan", password: "password")

    visit '/login'
    fill_in "Username", with: "brennan"
    fill_in "Password", with: "password"
    click_on "login"

    click_on "logout"

    assert page.has_content?("Thanks for visiting!")
  end
end
