class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :set_user, only: [:edit, :update]


  def edit
    redirect_to root_path, alert: "The information you entered is not valid." if @user.id != current_user.id
  end

  def update
    if @user.update(user_params)
      redirect_to root_path, alert: "Your account settings have been updated."
    else
      render :edit
    end 
  end


  private

    def user_params
      params.require(:user).permit(:id, :first_name, :last_name)
    end

    def set_user
     @user = User.find_by(id: params[:id])
    end

end