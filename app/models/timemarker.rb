class Timemarker < ActiveRecord::Base

  belongs_to :video
  belongs_to :step

  validates :marker, presence: true

  def step_attributes=(attributes)
    if attributes[:id].present? #allow for nested update, rather than only create/find and associate.
      existing = Step.find_by(id: attributes[:id])
      if self.step_id == existing.id #just update the step, if already associated.
         existing.update(attributes)
      else
         self.step = existing
      end
    else
      if attributes[:name].present? 
         new_join = Step.find_or_create_by(attributes)# will still protect against duplicates being made. (should I only search the current_user here?)
        self.step = new_join 
      end
    end
  end 


  def video_attributes=(attributes)
    if attributes[:id].present?
      existing = Video.find_by(id: attributes[:id])
      if self.video_id == existing.id
        existing.update(attributes)
      else
        self.video = existing
      end
    else
      if attributes[:url].present? && attributes[:title].present?
        new_join = Video.find_or_create_by(attributes)
        self.video = new_join 
      end
    end
  end

  def self.filter_by_instance(step_id, video_id)
    where(step_id: step_id, video_id: video_id).map{|i| i.marker}.join(", ") 
  end  # a step may occur multiple times in the same video.  



end
