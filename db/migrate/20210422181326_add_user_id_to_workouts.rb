class AddUserIdToWorkouts < ActiveRecord::Migration[6.1]
  def change
    add_column :workouts, :user_id, :int
  end
end
