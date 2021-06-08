require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get commercial" do
    get pages_commercial_url
    assert_response :success
  end

end
