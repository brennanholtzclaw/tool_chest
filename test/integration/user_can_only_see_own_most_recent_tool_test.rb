require 'test_helper'

class UserCanOnlySeeOwnMostRecentToolTest < ActionDispatch::IntegrationTest
  test "user sees own most recent tool and doesn't see other user's" do
    user1 = User.create(username: "brennan", password: "password")
    user2 = User.create(username: "jacob", password: "password")

    visit '/login'
    fill_in "Username", with: "brennan"
    fill_in "Password", with: "password"
    click_on "login"

  end
end
