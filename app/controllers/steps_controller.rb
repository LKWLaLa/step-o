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
     if params[:author_id] == current_user.id
      @step = current_user.steps.find_by(id: params[:id])
      redirect_to user_steps_path(current_user), alert: "Step not found." if @step.nil?
    else
      redirect_to root_path, alert: "Access denied."
    end
  end

  def update
    if @step.update(video_params)
      redirect_to user_steps_path(current_user), alert: "Your step has been updated."
    end
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
    @step = Step.find_by(id: params[:id])
  end
  

end




