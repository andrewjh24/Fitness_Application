require "test_helper"

class CreateCategoryTest < ActionDispatch::IntegrationTest
  test "get new difficulty form and create the difficulty" do
    get "/difficulties/new"
    assert_response :success
    assert_difference 'Difficulty.count', 1 do
      post difficulties_path, params: { difficulty: { name: "Beginner"} }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Beginner", response.body
  end
end
