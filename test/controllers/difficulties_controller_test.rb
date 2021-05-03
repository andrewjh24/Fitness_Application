require "test_helper"

class DifficultiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @difficulty = Difficulty.create(name: "Beginner")
    @admin_user = User.create(username: "johndoe", email: "johndoe@example.com", password:"password", admin: true)
  end

  test "should get index" do
    get difficulties_url
    assert_response :success
  end

  test "should get new" do
    sign_in_as(@admin_user)
    get new_difficulty_url
    assert_response :success
  end

  test "should create difficulty" do
    sign_in_as(@admin_user)
    assert_difference('Difficulty.count', 1) do
      post difficulties_url, params: { difficulty: { name: "Expert" } }
    end

    assert_redirected_to difficulty_url(Difficulty.last)
  end

  test "should not create difficulty if not admin" do
    assert_no_difference('Difficulty.count') do
      post difficulties_url, params: { difficulty: { name: "Expert" } }
    end

    assert_redirected_to difficulties_url
  end

  test "should show difficulty" do
    get difficulty_url(@difficulty)
    assert_response :success
  end

  # test "should get edit" do
  #   get edit_difficulty_url(@difficulty)
  #   assert_response :success
  # end

  # test "should update difficulty" do
  #   patch difficulty_url(@difficulty), params: { difficulty: {  } }
  #   assert_redirected_to difficulty_url(@difficulty)
  # end

  # test "should destroy difficulty" do
  #   assert_difference('Difficulty.count', -1) do
  #     delete difficulty_url(@difficulty)
  #   end
  #
  #   assert_redirected_to difficulties_url
  # end
end
