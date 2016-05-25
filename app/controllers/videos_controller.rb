class VideosController < ApplicationController

  before_action :authenticate_user!, :set_video, only: [:edit, :show, :destroy, :update]

  def index
    if params[:user_id] == current_user.id.to_s
      if params[:search]
        @videos = Video.search(params[:search])
      elsif params[:style] &&  params[:style][:id].present?
        @videos = current_user.videos.filter_by_style(params[:style][:id])
      else
        @videos = current_user.videos
      end
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
    if @video.save
      redirect_to user_video_path(current_user, @video), alert: "Your video has been successfully added."
    else
      render :new
    end
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
    if @video.update(video_params)
      redirect_to user_video_path(current_user, @video), alert: "Your video has been updated."
    else
      render :edit
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
    params.require(:video).permit(:title, :url, :notes, :year, :user_id, step_ids:[], :timemarkers_attributes => [:id, :marker, :_destroy, :step_attributes => [:id, :name, :user_id, :level_of_mastery, :notes, style_ids: []]])
  end

  def set_video
    @video = Video.find_by(id: params[:id])
  end
  
end



