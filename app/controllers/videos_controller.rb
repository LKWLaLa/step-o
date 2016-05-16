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
    if params[:author_id] == current_user.id
      @video = current_user.videos.find_by(id: params[:id])
      redirect_to user_videos_path(current_user), alert: "Video not found." if @video.nil?
    else
      redirect_to root_path, alert: "Access denied."
    end
  end

  def update
    if @video.update(video_params)
      redirect_to user_videos_path(current_user), alert: "Your video has been updated."
    end
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
    @video = Video.find_by(id: params[:id])
  end
  

end



