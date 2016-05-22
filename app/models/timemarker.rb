class Timemarker < ActiveRecord::Base

  belongs_to :video
  belongs_to :step

  def step_attributes=(attributes)
    if attributes[:name].present? 
      this_step = Step.find_or_create_by(attributes)
      self.step = this_step #if !self.step.include?(step)
    end
  end 

  def video_attributes=(attributes)
    if attributes[:url].present? && attributes[:title].present?
      this_video = Video.find_or_create_by(attributes)
      self.video = this_video #if !self.video.include?(video)
    end
  end



end
