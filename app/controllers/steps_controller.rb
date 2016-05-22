class StepsController < ApplicationController

  before_action :authenticate_user!, :set_step, only: [:edit, :show, :update, :destroy]

  def index
    if params[:user_id] == current_user.id.to_s
      @steps = current_user.steps
    else
      redirect_to root_path, alert: "Access denied."
    end
  end

  def new
    if params[:user_id] == current_user.id.to_s
      @step = Step.new(user_id: params[:user_id])
      @step.timemarkers.build.build_video
    else
      redirect_to root_path, alert: "Access denied."
    end
  end

  def create
    @step = Step.create(step_params)
    redirect_to user_steps_path(current_user)
  end

  def edit
     if params[:user_id] == current_user.id.to_s
      @step = current_user.steps.find_by(id: params[:id])
      @step.timemarkers.build.build_video
      redirect_to user_steps_path(current_user), alert: "Step not found." if @step.nil?
    else
      redirect_to root_path, alert: "Access denied."
    end
  end

  def update
    if @step.update(step_params)
      redirect_to user_steps_path(current_user), alert: "Your step has been successfully updated."
    end
  end

  def show
  end

  def destroy
    @step.destroy
    redirect_to user_steps_path(current_user), alert: "Your step has been sucessfully deleted."
  end

  private

  def step_params
    params.require(:step).permit(:name, :user_id, :level_of_mastery, :notes, style_ids: [], :video_ids => [], timemarkers_attributes: [:id, :marker, :_destroy, video_attributes: [:id, :user_id, :url, :title, :notes, :year]])
  end

  def set_step
    @step = Step.find_by(id: params[:id])
  end
  

end




