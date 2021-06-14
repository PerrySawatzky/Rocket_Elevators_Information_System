require 'test_helper'

class BuildingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @building = buildings(:one)
  end

  test "should get index" do
    get buildings_url
    assert_response :success
  end

  test "should get new" do
    get new_building_url
    assert_response :success
  end

  test "should create building" do
    assert_difference('Building.count') do
      post buildings_url, params: { building: { address_of_the_building: @building.address_of_the_building, customer_id: @building.customer_id, email_of_the_administrator_of_the_building: @building.email_of_the_administrator_of_the_building, full_name_of_the_building_administrator: @building.full_name_of_the_building_administrator, full_name_of_the_technical_contact_for_the_building: @building.full_name_of_the_technical_contact_for_the_building, phone_number_of_the_building_administrator: @building.phone_number_of_the_building_administrator, technical_contact_email_for_the_building: @building.technical_contact_email_for_the_building, technical_contact_phone_for_the_building: @building.technical_contact_phone_for_the_building } }
    end

    assert_redirected_to building_url(Building.last)
  end

  test "should show building" do
    get building_url(@building)
    assert_response :success
  end

  test "should get edit" do
    get edit_building_url(@building)
    assert_response :success
  end

  test "should update building" do
    patch building_url(@building), params: { building: { address_of_the_building: @building.address_of_the_building, customer_id: @building.customer_id, email_of_the_administrator_of_the_building: @building.email_of_the_administrator_of_the_building, full_name_of_the_building_administrator: @building.full_name_of_the_building_administrator, full_name_of_the_technical_contact_for_the_building: @building.full_name_of_the_technical_contact_for_the_building, phone_number_of_the_building_administrator: @building.phone_number_of_the_building_administrator, technical_contact_email_for_the_building: @building.technical_contact_email_for_the_building, technical_contact_phone_for_the_building: @building.technical_contact_phone_for_the_building } }
    assert_redirected_to building_url(@building)
  end

  test "should destroy building" do
    assert_difference('Building.count', -1) do
      delete building_url(@building)
    end

    assert_redirected_to buildings_url
  end
end
