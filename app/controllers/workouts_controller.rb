class WorkoutsController < ApplicationController

  def show
    @workout = Workout.find(params[:id])
  end

  def index
    @workouts = Workout.all
  end

  def new

  end

  def create
    @workout = Workout.new(params.require(:workout).permit(:title, :description))
    @workout.save
    redirect_to @workout
  end

end
