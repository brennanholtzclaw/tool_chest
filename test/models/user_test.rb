require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "users can be normal or admins" do
    user = User.create(username: "brennan", password: "password", role: 1)
    admin = User.create(username: "brennan", password: "password", role: 2)

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit admin_categories_path

    within("#admin-categories") do
      assert page.has_content?("All Categories")
    end
  end
end
