class VideosController < ApplicationController

  before_action :authenticate_user!
  before_action :validate_user_nesting, only: [:index, :new, :edit, :show]
  before_action :set_video, only: [:edit, :show, :update, :destroy]

  def index
    if params[:search]
      @videos = current_user.videos.search(params[:search])
    elsif params[:style] && params[:style][:id].present?
      @videos = current_user.videos.filter_by_style(params[:style][:id])
    else
      @videos = current_user.videos
    end
  end

  def new
    @video = Video.new(user_id: params[:user_id])
    @video.timemarkers.build.build_step    
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
    @video.timemarkers.build.build_step
    redirect_to user_videos_path(current_user), alert: "Video not found." if @video.nil?
  end

  def update
    if @video.update(video_params)
      redirect_to user_video_path(current_user, @video), alert: "Your video has been updated."
    else
      render :edit
    end
  end

  def show
    redirect_to user_videos_path(current_user), alert: "Video not found." if @video.nil?
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
    @video = current_user.videos.find_by(id: params[:id])
  end

  def validate_user_nesting
     if params[:user_id] != current_user.id.to_s
       redirect_to root_path, alert: "Access denied."
     end
  end
  
end



