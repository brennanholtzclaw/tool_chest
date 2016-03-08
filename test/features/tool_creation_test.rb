require_relative '../test_helper'

class ToolCreationTest < ActionDispatch::IntegrationTest

  test "user can create a tool" do
    visit new_tool_path

    fill_in "Name", with: "Screwdriver"
    fill_in "Price", with: "1099"
    fill_in "Quantity", with: "11"
    click_link_or_button "Create Tool"

    assert_equal current_path, tool_path(Tool.last)

    within(".tool-info") do
      assert page.has_content?("Screwdriver")
      assert page.has_content?("10.99")
      assert page.has_content?("11")
    end
  end

end
