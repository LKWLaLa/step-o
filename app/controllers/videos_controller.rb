class VideosController < ApplicationController

  before_action :authenticate_user!, :set_video, only: [:edit, :show, :destroy, :update]

  def index
    if params[:user_id] == current_user.id.to_s
      @videos = current_user.videos
    else
      redirect_to root_path, alert: "Access denied."
    end

  end

  def new
    if params[:user_id] == current_user.id.to_s
      @video = Video.new(user_id: params[:user_id])
      @video.timemarkers.build.build_step
    else
      redirect_to root_path, alert: "Access denied."
    end
  end

  def create
    @video = Video.create(video_params)
    redirect_to user_videos_path(current_user)
  end

  def edit
    if params[:user_id] == current_user.id.to_s
      @video = current_user.videos.find_by(id: params[:id])
      @video.timemarkers.build.build_step
      redirect_to user_videos_path(current_user), alert: "Video not found." if @video.nil?
    else
      redirect_to root_path, alert: "Access denied."
    end
  end

  def update
    raise params.inspect
    if @video.update(video_params)
      redirect_to user_videos_path(current_user), alert: "Your video has been updated."
    end
  end

  def show
     if params[:user_id] == current_user.id.to_s
      @video = current_user.videos.find_by(id: params[:id])
      redirect_to user_videos_path(current_user), alert: "Video not found." if @video.nil?
    else
      redirect_to root_path, alert: "Access denied."
    end
  end

  def destroy
    @video.destroy
    redirect_to user_videos_path(current_user), alert: "Your video has been deleted."
  end

  private

  def video_params
    params.require(:video).permit(:title, :url, :notes, :year, :user_id, step_ids:[], :timemarkers_attributes => [:id, :marker, :step_attributes => [:id, :name, :user_id, :level_of_mastery, :notes, style_ids: []]])
  end

  def set_video
    @video = Video.find_by(id: params[:id])
  end
  
end



