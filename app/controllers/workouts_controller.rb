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

  def edit
    @workout = Workout.find(params[:id])
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

  def update
    @workout = Workout.find(params[:id])
    if @workout.update(params.require(:workout).permit(:title, :description))
      flash[:notice] = "Workout was updated successfully"
    else
      render 'edit'
    end
  end

  def destroy
    @workout = Workout.find(params[:id])
    @workout.destroy
    redirect_to workouts_path
  end

end
