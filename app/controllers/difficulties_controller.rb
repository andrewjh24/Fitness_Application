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

   def edit
     @difficulty = Difficulty.find(params[:id])
   end

   def update
     @difficulty = Difficulty.find(params[:id])
     if @difficulty.update(difficulty_params)
       flash[:notice] = "Updated successfully"
       redirect_to @difficulty
     else
       render 'edit'
     end
   end


   def index
     @difficulties = Difficulty.all
   end

   def show
     @difficulty = Difficulty.find(params[:id])
     @workouts = @difficulty.workouts.paginate(page: params[:page], per_page: 3)
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
