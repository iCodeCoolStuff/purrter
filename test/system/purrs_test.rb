require "application_system_test_case"

class PurrsTest < ApplicationSystemTestCase
  setup do
    @purr = purrs(:one)
  end

  test "visiting the index" do
    visit purrs_url
    assert_selector "h1", text: "Purrs"
  end

  test "creating a Purr" do
    visit purrs_url
    click_on "New Purr"

    fill_in "Content", with: @purr.content
    fill_in "User", with: @purr.user_id
    click_on "Create Purr"

    assert_text "Purr was successfully created"
    click_on "Back"
  end

  test "updating a Purr" do
    visit purrs_url
    click_on "Edit", match: :first

    fill_in "Content", with: @purr.content
    fill_in "User", with: @purr.user_id
    click_on "Update Purr"

    assert_text "Purr was successfully updated"
    click_on "Back"
  end

  test "destroying a Purr" do
    visit purrs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Purr was successfully destroyed"
  end
end
