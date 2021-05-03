require "test_helper"

class CreateCategoryTest < ActionDispatch::IntegrationTest

  setup do
    @admin_user = User.create(username: "johndoe", email: "johndoe@example.com", password:"password", admin: true)
    sign_in_as(@admin_user)
  end

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


  test "get new difficulty form and reject invalid difficulty submission" do
    get "/difficulties/new"
    assert_response :success
    assert_no_difference 'Difficulty.count' do
      post difficulties_path, params: { difficulty: { name: " "} }
    end
    assert_match "errors", response.body
    assert_select 'div.alert'
    assert_select 'h4.alert-heading'
  end
end
