class WorkoutsController < ApplicationController

  def show
    @workout = Workout.find(params[:id])
  end

  def index
    @workouts = Workout.all
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(params.require(:workout).permit(:title, :description))
    if @workout.save
      flash[:notice] = "Workout was created successfully"
      redirect_to @workout
    else
      render 'new'
    end
  end

end
