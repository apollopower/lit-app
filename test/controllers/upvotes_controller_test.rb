require 'test_helper'

class UpvotesControllerTest < ActionDispatch::IntegrationTest
  test "should get vote" do
    get upvotes_vote_url
    assert_response :success
  end

end
