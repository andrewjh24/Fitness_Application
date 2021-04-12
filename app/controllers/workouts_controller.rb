class WorkoutsController < ApplicationController

  def show
    @workout = Workout.find(params[:id])
  end

  def index
    @workouts = Workout.all
  end

end
