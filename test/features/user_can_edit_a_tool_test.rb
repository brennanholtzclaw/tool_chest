require_relative "../test_helper"

class UserCanEditAToolTest < ActionDispatch::IntegrationTest

  test "user can edit an existing tool" do
    tool = Tool.create(name: "Phillips Head", quantity: "12", price: "1499")
    visit edit_tool_path(tool)

    fill_in "Name", with: "Phil's Head"
    fill_in "Price", with: "899"
    fill_in "Quantity", with: "12"

    click_link_or_button "Update Tool"

    assert_equal current_path, tool_path(tool)

    within(".tool-info") do
      assert page.has_content?("Phil's Head")
      assert page.has_content?("8.99")
      assert page.has_content?("12")
    end
  end
end
