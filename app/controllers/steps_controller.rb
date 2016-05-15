class StepsController < ApplicationController

  before_action :authenticate_user!, :set_step, only: [:edit, :show, :destroy]

  def index
    @steps = current_user.steps
  end

  def new
    @step = Step.new(user_id: params[:user_id])
  end

  def create
    @step = Step.create(step_params)
    redirect_to user_steps_path(current_user)
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

  private

  def step_params
    params.require(:step).permit(:name, :user_id, :level_of_mastery, :notes)
  end

  def set_step
    @step = Step.find_by(params[:id])
  end
  

end




