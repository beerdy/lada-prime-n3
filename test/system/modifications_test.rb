require "application_system_test_case"

class ModificationsTest < ApplicationSystemTestCase
  setup do
    @modification = modifications(:one)
  end

  test "visiting the index" do
    visit modifications_url
    assert_selector "h1", text: "Modifications"
  end

  test "creating a Modification" do
    visit modifications_url
    click_on "New Modification"

    fill_in "Anchor name", with: @modification.anchor_name
    fill_in "Description", with: @modification.description
    fill_in "Link about", with: @modification.link_about
    fill_in "Link complectations", with: @modification.link_complectations
    fill_in "Name", with: @modification.name
    fill_in "Second name", with: @modification.second_name
    check "Show" if @modification.show
    fill_in "Sort", with: @modification.sort
    click_on "Create Modification"

    assert_text "Modification was successfully created"
    click_on "Back"
  end

  test "updating a Modification" do
    visit modifications_url
    click_on "Edit", match: :first

    fill_in "Anchor name", with: @modification.anchor_name
    fill_in "Description", with: @modification.description
    fill_in "Link about", with: @modification.link_about
    fill_in "Link complectations", with: @modification.link_complectations
    fill_in "Name", with: @modification.name
    fill_in "Second name", with: @modification.second_name
    check "Show" if @modification.show
    fill_in "Sort", with: @modification.sort
    click_on "Update Modification"

    assert_text "Modification was successfully updated"
    click_on "Back"
  end

  test "destroying a Modification" do
    visit modifications_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Modification was successfully destroyed"
  end
end
