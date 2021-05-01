require 'test_helper'

class DifficultyTest < ActiveSupport::TestCase

  test "difficulty should be valid" do
    @difficulty = Difficulty.new(name: "Beginner")
    assert @difficulty.valid?
  end

end
