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
    render plain: params[:workout]
  end

end
