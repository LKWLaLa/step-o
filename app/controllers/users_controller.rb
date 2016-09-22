class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :set_user, only: [:edit, :update]


  def edit
    redirect_to root_path, alert: "The information you entered is not valid." if @user.id != current_user.id
  end

  def update
  end


  private

    def step_params
      params.require(:user).permit(:id, :first_name, :last_name)
    end

    def set_user
     @user = User.find_by(id: params[:id])
    end

end