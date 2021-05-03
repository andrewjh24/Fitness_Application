require "test_helper"

class ListDifficultiesTest < ActionDispatch::IntegrationTest
  def setup
    @difficulty = Difficulty.create(name: "Beginner")
    @difficulty2 = Difficulty.create(name: "Expert")
  end

  test "Should show difficulties" do
    get '/difficulties'
    assert_select "a[href=?]", difficulty_path(@difficulty), text: @difficulty.name
    assert_select "a[href=?]", difficulty_path(@difficulty2), text: @difficulty2.name
  end
end
