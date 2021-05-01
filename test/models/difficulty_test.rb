require 'test_helper'

class DifficultyTest < ActiveSupport::TestCase

  def setup
    @difficulty = Difficulty.new(name: "Beginner")
  end


  test "difficulty should be valid" do
    assert @difficulty.valid?
  end

  test "difficulty should be present" do
    @difficulty.name = " "
    assert_not @difficulty.valid?
  end

  test "difficulty is not unique" do
    @difficulty.save
    @difficulty2 = Difficulty.new(name: "Beginner")
    assert_not @difficulty2.valid?
  end

  test "difficulty name is too long" do
    @difficulty.name = "d" * 21
    assert_not @difficulty.valid?
  end

  test "difficulty name is too short" do
    @difficulty.name = "aa"
    assert_not @difficulty.valid?
  end

end
