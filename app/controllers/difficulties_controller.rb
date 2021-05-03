class DifficultiesController < ApplicationController
before_action :require_admin, except: [:index, :show]

   def new
     @difficulty = Difficulty.new
   end

   def create
     @difficulty = Difficulty.new(difficulty_params)
     if @difficulty.save
       flash[:notice] = "Difficulty was successfully created"
       redirect_to @difficulty
     else
       render 'new'
     end
   end

   def index
     @difficulties = Difficulty.all
   end

   def show
     @difficulty = Difficulty.find(params[:id])
   end

   private

   def difficulty_params
    params.require(:difficulty).permit(:name)
   end

   def require_admin
     if !(logged_in? && current_user.admin?)
       flash[:alert] = "Only admins can perform that action"
       redirect_to difficulties_path
     end
   end

end
