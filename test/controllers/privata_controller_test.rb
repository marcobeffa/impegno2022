require "test_helper"

class PrivataControllerTest < ActionDispatch::IntegrationTest
  test "should get pastslot" do
    get privata_pastslot_url
    assert_response :success
  end
end
