require "application_system_test_case"

class Service::WorksTest < ApplicationSystemTestCase
  setup do
    @service_work = service_works(:one)
  end

  test "visiting the index" do
    visit service_works_url
    assert_selector "h1", text: "Service/Works"
  end

  test "creating a Work" do
    visit service_works_url
    click_on "New Service/Work"

    fill_in "Description", with: @service_work.description
    fill_in "Link", with: @service_work.link
    check "Show" if @service_work.show
    fill_in "Slave", with: @service_work.slave
    fill_in "Sort", with: @service_work.sort
    fill_in "Title", with: @service_work.title
    fill_in "Url", with: @service_work.url
    click_on "Create Work"

    assert_text "Work was successfully created"
    click_on "Back"
  end

  test "updating a Work" do
    visit service_works_url
    click_on "Edit", match: :first

    fill_in "Description", with: @service_work.description
    fill_in "Link", with: @service_work.link
    check "Show" if @service_work.show
    fill_in "Slave", with: @service_work.slave
    fill_in "Sort", with: @service_work.sort
    fill_in "Title", with: @service_work.title
    fill_in "Url", with: @service_work.url
    click_on "Update Work"

    assert_text "Work was successfully updated"
    click_on "Back"
  end

  test "destroying a Work" do
    visit service_works_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Work was successfully destroyed"
  end
end
