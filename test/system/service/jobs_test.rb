require "application_system_test_case"

class Service::JobsTest < ApplicationSystemTestCase
  setup do
    @service_job = service_jobs(:one)
  end

  test "visiting the index" do
    visit service_jobs_url
    assert_selector "h1", text: "Service/Jobs"
  end

  test "creating a Job" do
    visit service_jobs_url
    click_on "New Service/Job"

    fill_in "Description", with: @service_job.description
    fill_in "Link", with: @service_job.link
    check "Show" if @service_job.show
    fill_in "Slave", with: @service_job.slave
    fill_in "Sort", with: @service_job.sort
    fill_in "Title", with: @service_job.title
    fill_in "Url", with: @service_job.url
    click_on "Create Job"

    assert_text "Job was successfully created"
    click_on "Back"
  end

  test "updating a Job" do
    visit service_jobs_url
    click_on "Edit", match: :first

    fill_in "Description", with: @service_job.description
    fill_in "Link", with: @service_job.link
    check "Show" if @service_job.show
    fill_in "Slave", with: @service_job.slave
    fill_in "Sort", with: @service_job.sort
    fill_in "Title", with: @service_job.title
    fill_in "Url", with: @service_job.url
    click_on "Update Job"

    assert_text "Job was successfully updated"
    click_on "Back"
  end

  test "destroying a Job" do
    visit service_jobs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Job was successfully destroyed"
  end
end
