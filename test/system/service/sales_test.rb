require "application_system_test_case"

class Service::SalesTest < ApplicationSystemTestCase
  setup do
    @service_sale = service_sales(:one)
  end

  test "visiting the index" do
    visit service_sales_url
    assert_selector "h1", text: "Service/Sales"
  end

  test "creating a Sale" do
    visit service_sales_url
    click_on "New Service/Sale"

    fill_in "Description", with: @service_sale.description
    fill_in "Link", with: @service_sale.link
    check "Show" if @service_sale.show
    fill_in "Slave", with: @service_sale.slave
    fill_in "Sort", with: @service_sale.sort
    fill_in "Title", with: @service_sale.title
    fill_in "Url", with: @service_sale.url
    click_on "Create Sale"

    assert_text "Sale was successfully created"
    click_on "Back"
  end

  test "updating a Sale" do
    visit service_sales_url
    click_on "Edit", match: :first

    fill_in "Description", with: @service_sale.description
    fill_in "Link", with: @service_sale.link
    check "Show" if @service_sale.show
    fill_in "Slave", with: @service_sale.slave
    fill_in "Sort", with: @service_sale.sort
    fill_in "Title", with: @service_sale.title
    fill_in "Url", with: @service_sale.url
    click_on "Update Sale"

    assert_text "Sale was successfully updated"
    click_on "Back"
  end

  test "destroying a Sale" do
    visit service_sales_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sale was successfully destroyed"
  end
end
