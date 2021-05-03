class WorkoutDifficulty < ApplicationRecord
  belongs_to :workout
  belongs_to :difficulty
end
