class PagesController < ApplicationController

  def home
    redirect_to workouts_path if logged_in?
  end

  def about
  end
end
