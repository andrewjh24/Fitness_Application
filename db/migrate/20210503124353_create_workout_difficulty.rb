class CreateWorkoutDifficulty < ActiveRecord::Migration[6.1]
  def change
    create_table :workout_difficulties do |t|
      t.integer :difficulty_id
      t.integer :workout_id
    end
  end
end
