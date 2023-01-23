require "application_system_test_case"

class BlazosTest < ApplicationSystemTestCase
  setup do
    @blazo = blazos(:one)
  end

  test "visiting the index" do
    visit blazos_url
    assert_selector "h1", text: "Blazos"
  end

  test "should create blazo" do
    visit blazos_url
    click_on "New blazo"

    fill_in "Abstract", with: @blazo.abstract
    fill_in "Content", with: @blazo.content
    fill_in "User", with: @blazo.user_id
    click_on "Create Blazo"

    assert_text "Blazo was successfully created"
    click_on "Back"
  end

  test "should update Blazo" do
    visit blazo_url(@blazo)
    click_on "Edit this blazo", match: :first

    fill_in "Abstract", with: @blazo.abstract
    fill_in "Content", with: @blazo.content
    fill_in "User", with: @blazo.user_id
    click_on "Update Blazo"

    assert_text "Blazo was successfully updated"
    click_on "Back"
  end

  test "should destroy Blazo" do
    visit blazo_url(@blazo)
    click_on "Destroy this blazo", match: :first

    assert_text "Blazo was successfully destroyed"
  end
end
