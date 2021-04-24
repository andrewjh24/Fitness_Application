class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @workouts = @user.workouts
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Your account infortmation successfully updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Congratulations #{@user.username} on joining the HomeFitness family!!! You have successfully created and account"
      redirect_to workouts_path
    else
      render 'new'
    end
  end


  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
