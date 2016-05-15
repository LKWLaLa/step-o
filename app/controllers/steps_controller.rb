class StepsController < ApplicationController

  before_action :authenticate_user!, :set_step, only: [:edit, :show, :destroy]

  def index
    @steps = current_user.steps
  end

  def new
    @step = Step.new(step_params)
  end

  def create
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
  end

  def set_step
    @step = Step.find_by(params[:id])
  end
  

end




