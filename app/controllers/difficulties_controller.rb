class DifficultiesController < ApplicationController

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

   end

   def show

   end

   private

   def difficulty_params
    params.require(:difficulty).permit(:name)
   end

end
