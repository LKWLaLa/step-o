class Timemarker < ActiveRecord::Base

  belongs_to :video
  belongs_to :step

  validates :marker, presence: true

  def step_attributes=(attributes)
    if attributes[:id].present? 
      existing = Step.find_by(id: attributes[:id])
      self.step = existing
    else
      if attributes[:name].present? 
        new_step = (Step.find_by(user_id: attributes[:user_id], 
          name: attributes[:name]) || Step.create(attributes))
        self.step = new_step
      end
    end
  end 


  def video_attributes=(attributes)
    if attributes[:id].present?
      existing = Video.find_by(id: attributes[:id])
      self.video = existing
    else
      if attributes[:url].present? && attributes[:title].present?
        new_video = (Video.find_by(user_id: attributes[:user_id], 
          title: attributes[:title]) || Video.create(attributes))
        self.video = new_video
      end
    end
  end

  def self.filter_by_instance(step_id, video_id)
    where(step_id: step_id, video_id: video_id).map{|i| i.marker}.join(", ") 
  end  # a step may occur multiple times in the same video.  



end
