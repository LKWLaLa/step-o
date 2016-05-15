class VideosController < ApplicationController

  before_action :authenticate_user!, :set_video, only: [:edit, :show, :destroy]

  def index
    @videos = current_user.videos
  end

  def new
    @video = Video.new(user_id: params[:user_id])
  end

  def create
    @video = Video.create(video_params)
    redirect_to user_videos_path(current_user)
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
    params.require(:video).permit(:title, :url, :notes, :year, :user_id)
  end

  def set_video
    @video = Video.find_by(params[:id])
  end
  

end



