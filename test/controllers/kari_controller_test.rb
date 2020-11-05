require 'test_helper'

class KariControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get kari_index_url
    assert_response :success
  end

end
