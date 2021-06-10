require 'test_helper'

class QuotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quote = quotes(:one)
  end

  test "should get index" do
    get quotes_url
    assert_response :success
  end

  test "should get new" do
    get new_quote_url
    assert_response :success
  end

  test "should create quote" do
    assert_difference('Quote.count') do
      post quotes_url, params: { quote: { apartments: @quote.apartments, basements: @quote.basements, building_type: @quote.building_type, business_hours: @quote.business_hours, companies: @quote.companies, corporations: @quote.corporations, elevators: @quote.elevators, floors: @quote.floors, max_occupancy_per_floor: @quote.max_occupancy_per_floor, parking_spots: @quote.parking_spots, product_line: @quote.product_line } }
    end

    assert_redirected_to quote_url(Quote.last)
  end

  test "should show quote" do
    get quote_url(@quote)
    assert_response :success
  end

  test "should get edit" do
    get edit_quote_url(@quote)
    assert_response :success
  end

  test "should update quote" do
    patch quote_url(@quote), params: { quote: { apartments: @quote.apartments, basements: @quote.basements, building_type: @quote.building_type, business_hours: @quote.business_hours, companies: @quote.companies, corporations: @quote.corporations, elevators: @quote.elevators, floors: @quote.floors, max_occupancy_per_floor: @quote.max_occupancy_per_floor, parking_spots: @quote.parking_spots, product_line: @quote.product_line } }
    assert_redirected_to quote_url(@quote)
  end

  test "should destroy quote" do
    assert_difference('Quote.count', -1) do
      delete quote_url(@quote)
    end

    assert_redirected_to quotes_url
  end
end
