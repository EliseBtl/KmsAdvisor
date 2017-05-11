require 'test_helper'

class MenControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get men_index_url
    assert_response :success
  end

end
