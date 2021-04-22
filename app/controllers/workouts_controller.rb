class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @workouts = Workout.all
  end

  def new
    @workout = Workout.new
  end

  def edit
  end

  def create
    @workout = Workout.new(workout_params)
    @workout.user = User.first
    if @workout.save
      flash[:notice] = "Workout was created successfully"
      redirect_to @workout
    else
      render 'new'
    end
  end

  def update
    if @workout.update(workout_params)
      flash[:notice] = "Workout was updated successfully"
      redirect_to @workout
    else
      render 'edit'
    end
  end

  def destroy
    @workout.destroy
    redirect_to workouts_path
  end

  private

  def set_workout
    @workout = Workout.find(params[:id])
  end

  def workout_params
    params.require(:workout).permit(:title, :description)
  end

end
