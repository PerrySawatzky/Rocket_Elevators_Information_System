require 'test_helper'

class BuildingDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @building_detail = building_details(:one)
  end

  test "should get index" do
    get building_details_url
    assert_response :success
  end

  test "should get new" do
    get new_building_detail_url
    assert_response :success
  end

  test "should create building_detail" do
    assert_difference('BuildingDetail.count') do
      post building_details_url, params: { building_detail: { building_id: @building_detail.building_id, information_key: @building_detail.information_key, value: @building_detail.value } }
    end

    assert_redirected_to building_detail_url(BuildingDetail.last)
  end

  test "should show building_detail" do
    get building_detail_url(@building_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_building_detail_url(@building_detail)
    assert_response :success
  end

  test "should update building_detail" do
    patch building_detail_url(@building_detail), params: { building_detail: { building_id: @building_detail.building_id, information_key: @building_detail.information_key, value: @building_detail.value } }
    assert_redirected_to building_detail_url(@building_detail)
  end

  test "should destroy building_detail" do
    assert_difference('BuildingDetail.count', -1) do
      delete building_detail_url(@building_detail)
    end

    assert_redirected_to building_details_url
  end
end
