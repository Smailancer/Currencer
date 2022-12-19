require "test_helper"

class CorrenciesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get correncies_index_url
    assert_response :success
  end
end
