require "application_system_test_case"

class AddressesTest < ApplicationSystemTestCase
  setup do
    @address = addresses(:one)
  end

  test "visiting the index" do
    visit addresses_url
    assert_selector "h1", text: "Addresses"
  end

  test "creating a Address" do
    visit addresses_url
    click_on "New Address"

    fill_in "City", with: @address.city
    fill_in "Country", with: @address.country
    fill_in "Entity", with: @address.entity
    fill_in "Notes", with: @address.notes
    fill_in "Number and street", with: @address.number_and_street
    fill_in "Postal code", with: @address.postal_code
    fill_in "Status", with: @address.status
    fill_in "Suite or apartment", with: @address.suite_or_apartment
    fill_in "Type of address", with: @address.type_of_address
    click_on "Create Address"

    assert_text "Address was successfully created"
    click_on "Back"
  end

  test "updating a Address" do
    visit addresses_url
    click_on "Edit", match: :first

    fill_in "City", with: @address.city
    fill_in "Country", with: @address.country
    fill_in "Entity", with: @address.entity
    fill_in "Notes", with: @address.notes
    fill_in "Number and street", with: @address.number_and_street
    fill_in "Postal code", with: @address.postal_code
    fill_in "Status", with: @address.status
    fill_in "Suite or apartment", with: @address.suite_or_apartment
    fill_in "Type of address", with: @address.type_of_address
    click_on "Update Address"

    assert_text "Address was successfully updated"
    click_on "Back"
  end

  test "destroying a Address" do
    visit addresses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Address was successfully destroyed"
  end
end
