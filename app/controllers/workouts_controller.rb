class WorkoutsController < ApplicationController

  def show
    byebug
    @workout = Workout.find(params[:id])
  end

end
