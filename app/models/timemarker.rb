class Timemarker < ActiveRecord::Base

  belongs_to :video
  belongs_to :step

  def step_attributes=(step_attributes)
    step_attributes.each do |attributes|
      if attributes[:name].present? 
        step = Step.find_or_create_by(attributes)
        self.build(:step => step) if !self.step.include?(step)
      end
    end
  end 

  def video_attributes=(video_attributes)
    video_attributes.each do |attributes|
      if attributes[:url].present? && attributes[:title].present?
        video = Video.find_or_create_by(attributes)
        self.build(:video => video) if !self.video.include?(video)
      end
    end
  end



end
