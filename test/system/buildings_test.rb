require "application_system_test_case"

class BuildingsTest < ApplicationSystemTestCase
  setup do
    @building = buildings(:one)
  end

  test "visiting the index" do
    visit buildings_url
    assert_selector "h1", text: "Buildings"
  end

  test "creating a Building" do
    visit buildings_url
    click_on "New Building"

    fill_in "Address of the building", with: @building.address_of_the_building
    fill_in "Customer", with: @building.customer_id
    fill_in "Email of the administrator of the building", with: @building.email_of_the_administrator_of_the_building
    fill_in "Full name of the building administrator", with: @building.full_name_of_the_building_administrator
    fill_in "Full name of the technical contact for the building", with: @building.full_name_of_the_technical_contact_for_the_building
    fill_in "Phone number of the building administrator", with: @building.phone_number_of_the_building_administrator
    fill_in "Technical contact email for the building", with: @building.technical_contact_email_for_the_building
    fill_in "Technical contact phone for the building", with: @building.technical_contact_phone_for_the_building
    click_on "Create Building"

    assert_text "Building was successfully created"
    click_on "Back"
  end

  test "updating a Building" do
    visit buildings_url
    click_on "Edit", match: :first

    fill_in "Address of the building", with: @building.address_of_the_building
    fill_in "Customer", with: @building.customer_id
    fill_in "Email of the administrator of the building", with: @building.email_of_the_administrator_of_the_building
    fill_in "Full name of the building administrator", with: @building.full_name_of_the_building_administrator
    fill_in "Full name of the technical contact for the building", with: @building.full_name_of_the_technical_contact_for_the_building
    fill_in "Phone number of the building administrator", with: @building.phone_number_of_the_building_administrator
    fill_in "Technical contact email for the building", with: @building.technical_contact_email_for_the_building
    fill_in "Technical contact phone for the building", with: @building.technical_contact_phone_for_the_building
    click_on "Update Building"

    assert_text "Building was successfully updated"
    click_on "Back"
  end

  test "destroying a Building" do
    visit buildings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Building was successfully destroyed"
  end
end
