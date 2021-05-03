class Workout < ApplicationRecord
  belongs_to :user
  has_many :workout_difficulties
  has_many :difficulties, through: :workout_difficulties
  #Validation code for DB entries
  validates :title, presence: true, length: { minimum: 6, maximum: 100}
  validates :description, presence: true, length: { minimum: 10, maximum: 300}
end
