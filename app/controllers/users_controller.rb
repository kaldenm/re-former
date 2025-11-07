# HTTP is stateless which means each request is separate. TO submit you have to build the object first hence when you use .new to create hte object and THEN try ot submit it
class UsersController < ApplicationController
  def new
    @user = User.new
  end 

  def create
    @user = User.new(user_params)
    if @user.save 
      redirect_to new_user_path
    else 
      render :new, status: :unprocessable_entity
    end 
  end 

  def edit 
    @user = User.find(params[:id])
  end 

  def update 
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user 
    end 
  end 
end

def user_params 
  params.require(:user).permit(:user_name, :password, :email)
end 