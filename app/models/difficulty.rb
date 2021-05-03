class Difficulty < ApplicationRecord
  has_many :workout_difficulties
  has_many :workouts, through: :workout_difficulties

  validates :name, presence: true, length: { minimum: 4, maximum: 20}
  validates_uniqueness_of :name
end
