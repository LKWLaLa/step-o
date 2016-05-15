class VideosController < ApplicationController

  before_action :authenticate_user!, :set_video, only: [:edit, :show, :destroy]

  def index
    @videos = current_user.videos
  end

  def new
    @video = Video.new(video_params)
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

  def video_params
  end

  def set_video
    @video = Video.find_by(params[:id])
  end
  

end



