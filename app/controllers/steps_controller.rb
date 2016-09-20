class StepsController < ApplicationController

  before_action :authenticate_user!
  before_action :validate_user_nesting, only: [:index, :new, :edit, :show]
  before_action :set_step, only: [:edit, :show, :update, :destroy]

  def index
    if params[:search]
      @steps = current_user.steps.search(params[:search]).page(params[:page])
    elsif params[:style] && params[:style][:id].present?
      @steps = current_user.steps.filter_by_style(params[:style][:id]).page(params[:page])
    else
      @steps = current_user.steps.order(:name).page(params[:page])
    end
  end

  def new
    @step = Step.new(user_id: params[:user_id])
    @step.timemarkers.build.build_video
  end

  def create
    @step = Step.create(step_params)
    if @step.save
      redirect_to user_step_path(current_user, @step), alert: "Your step has been created."
    else
      render :new
    end
  end

  def edit
    @step.timemarkers.build.build_video
    redirect_to user_steps_path(current_user), alert: "Step not found." if @step.nil?
  end

  def update
    if @step.update(step_params)
      redirect_to user_step_path(current_user, @step), alert: "Your step has been successfully updated."
    else
      render :edit
    end
  end

  def show
     respond_to do |format|
      format.html { redirect_to user_steps_path(current_user), alert: "Step not found." if @step.nil? }
      format.json { render json: @step}
    end
  end

  def destroy
    @step.destroy
    redirect_to user_steps_path(current_user), alert: "Your step has been sucessfully deleted."
  end


  private

  def step_params
    params.require(:step).permit(:name, :user_id, :level_of_mastery, :notes, :style_ids => [], styles_attributes: [:name], :video_ids => [], timemarkers_attributes: [:id, :marker, :_destroy, video_attributes: [:id, :user_id, :url, :title, :notes, :year]])
  end

  def set_step
   @step = current_user.steps.find_by(id: params[:id])
  end

  def validate_user_nesting
     if params[:user_id] != current_user.id.to_s
       redirect_to root_path, alert: "Access denied."
     end
  end


  

end




