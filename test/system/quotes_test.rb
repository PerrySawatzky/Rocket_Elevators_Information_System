require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
  setup do
    @quote = quotes(:one)
  end

  test "visiting the index" do
    visit quotes_url
    assert_selector "h1", text: "Quotes"
  end

  test "creating a Quote" do
    visit quotes_url
    click_on "New Quote"

    fill_in "Apartments", with: @quote.apartments
    fill_in "Basements", with: @quote.basements
    fill_in "Building type", with: @quote.building_type
    fill_in "Business hours", with: @quote.business_hours
    fill_in "Companies", with: @quote.companies
    fill_in "Corporations", with: @quote.corporations
    fill_in "Elevators", with: @quote.elevators
    fill_in "Floors", with: @quote.floors
    fill_in "Max occupancy per floor", with: @quote.max_occupancy_per_floor
    fill_in "Parking spots", with: @quote.parking_spots
    fill_in "Product line", with: @quote.product_line
    click_on "Create Quote"

    assert_text "Quote was successfully created"
    click_on "Back"
  end

  test "updating a Quote" do
    visit quotes_url
    click_on "Edit", match: :first

    fill_in "Apartments", with: @quote.apartments
    fill_in "Basements", with: @quote.basements
    fill_in "Building type", with: @quote.building_type
    fill_in "Business hours", with: @quote.business_hours
    fill_in "Companies", with: @quote.companies
    fill_in "Corporations", with: @quote.corporations
    fill_in "Elevators", with: @quote.elevators
    fill_in "Floors", with: @quote.floors
    fill_in "Max occupancy per floor", with: @quote.max_occupancy_per_floor
    fill_in "Parking spots", with: @quote.parking_spots
    fill_in "Product line", with: @quote.product_line
    click_on "Update Quote"

    assert_text "Quote was successfully updated"
    click_on "Back"
  end

  test "destroying a Quote" do
    visit quotes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Quote was successfully destroyed"
  end
end
