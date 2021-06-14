require "application_system_test_case"

class LeadsTest < ApplicationSystemTestCase
  setup do
    @lead = leads(:one)
  end

  test "visiting the index" do
    visit leads_url
    assert_selector "h1", text: "Leads"
  end

  test "creating a Lead" do
    visit leads_url
    click_on "New Lead"

    fill_in "Attached file", with: @lead.attached_file
    fill_in "Company name", with: @lead.company_name
    fill_in "Date of contact request", with: @lead.date_of_contact_request
    fill_in "Dept in charge of elevators", with: @lead.dept_in_charge_of_elevators
    fill_in "Email", with: @lead.email
    fill_in "Full name", with: @lead.full_name
    fill_in "Message", with: @lead.message
    fill_in "Phone", with: @lead.phone
    fill_in "Project description", with: @lead.project_description
    fill_in "Project name", with: @lead.project_name
    click_on "Create Lead"

    assert_text "Lead was successfully created"
    click_on "Back"
  end

  test "updating a Lead" do
    visit leads_url
    click_on "Edit", match: :first

    fill_in "Attached file", with: @lead.attached_file
    fill_in "Company name", with: @lead.company_name
    fill_in "Date of contact request", with: @lead.date_of_contact_request
    fill_in "Dept in charge of elevators", with: @lead.dept_in_charge_of_elevators
    fill_in "Email", with: @lead.email
    fill_in "Full name", with: @lead.full_name
    fill_in "Message", with: @lead.message
    fill_in "Phone", with: @lead.phone
    fill_in "Project description", with: @lead.project_description
    fill_in "Project name", with: @lead.project_name
    click_on "Update Lead"

    assert_text "Lead was successfully updated"
    click_on "Back"
  end

  test "destroying a Lead" do
    visit leads_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Lead was successfully destroyed"
  end
end
