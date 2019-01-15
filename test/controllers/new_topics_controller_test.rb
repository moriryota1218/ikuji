require 'test_helper'

class NewTopicsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_topics_new_url
    assert_response :success
  end

end
