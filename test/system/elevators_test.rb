require "application_system_test_case"

class ElevatorsTest < ApplicationSystemTestCase
  setup do
    @elevator = elevators(:one)
  end

  test "visiting the index" do
    visit elevators_url
    assert_selector "h1", text: "Elevators"
  end

  test "creating a Elevator" do
    visit elevators_url
    click_on "New Elevator"

    fill_in "Certificate of inspection", with: @elevator.certificate_of_inspection
    fill_in "Column", with: @elevator.column_id
    fill_in "Date of commissioning", with: @elevator.date_of_commissioning
    fill_in "Information", with: @elevator.information
    fill_in "Last inspection", with: @elevator.last_inspection
    fill_in "Model", with: @elevator.model
    fill_in "Notes", with: @elevator.notes
    fill_in "Serial number", with: @elevator.serial_number
    fill_in "Status", with: @elevator.status
    fill_in "Type", with: @elevator.type
    click_on "Create Elevator"

    assert_text "Elevator was successfully created"
    click_on "Back"
  end

  test "updating a Elevator" do
    visit elevators_url
    click_on "Edit", match: :first

    fill_in "Certificate of inspection", with: @elevator.certificate_of_inspection
    fill_in "Column", with: @elevator.column_id
    fill_in "Date of commissioning", with: @elevator.date_of_commissioning
    fill_in "Information", with: @elevator.information
    fill_in "Last inspection", with: @elevator.last_inspection
    fill_in "Model", with: @elevator.model
    fill_in "Notes", with: @elevator.notes
    fill_in "Serial number", with: @elevator.serial_number
    fill_in "Status", with: @elevator.status
    fill_in "Type", with: @elevator.type
    click_on "Update Elevator"

    assert_text "Elevator was successfully updated"
    click_on "Back"
  end

  test "destroying a Elevator" do
    visit elevators_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Elevator was successfully destroyed"
  end
end
