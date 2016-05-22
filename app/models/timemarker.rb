class Timemarker < ActiveRecord::Base

  belongs_to :video
  belongs_to :step

  def step_attributes=(attributes)
    if attributes[:id].present?
      existing = Step.find_by(id: attributes[:id])
      if self.step_id == existing.id
         existing.update(attributes)
      else
         self.step = existing
      end
    else
      if attributes[:name].present? 
         new_join = Step.find_or_create_by(attributes)
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



end
