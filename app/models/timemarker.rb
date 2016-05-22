class Timemarker < ActiveRecord::Base

  belongs_to :video
  belongs_to :step

  def step_attributes=(attributes)
    if attributes[:name].present? 
      if attributes[:id].present?
        existing_join = Step.find_by(id: attributes[:id])
        existing_join.update(attributes)
      else
        new_join = Step.find_or_create_by(attributes)
        self.step = new_join 
      end
    end
  end 


  def video_attributes=(attributes)
    if attributes[:url].present? && attributes[:title].present?
      if attributes[:id].present?
        existing_join = Video.find_by(id: attributes[:id])
        existing_join.update(attributes)
      else
        new_join = Video.find_or_create_by(attributes)
        self.video = new_join 
      end
    end
  end



end
