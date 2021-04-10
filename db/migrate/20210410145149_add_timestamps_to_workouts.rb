class AddTimestampsToWorkouts < ActiveRecord::Migration[6.1]
  def change
    add_column :workouts, :created_at, :datetime
    add_column :workouts, :updated_at, :datetime
  end
end
