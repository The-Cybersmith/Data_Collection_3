require "test_helper"

class ThreatControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get threat_show_url
    assert_response :success
  end

  test "should get create" do
    get threat_create_url
    assert_response :success
  end
end
