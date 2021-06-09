require 'test_helper'

class QuotePageControllerTest < ActionDispatch::IntegrationTest
  test "should get quote" do
    get quote_page_quote_url
    assert_response :success
  end

end
