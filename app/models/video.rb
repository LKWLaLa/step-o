class Video < ActiveRecord::Base

  belongs_to :user
  has_many :timemarkers, inverse_of: :video 
  has_many :steps, through: :timemarkers
  has_many :styles, through: :steps

  validates :url, presence: true
  validates :title, presence: true


  def steps_attributes=(steps_attributes)
    steps_attributes.each do |step_attribute|
      if step_attribute[:name].present? 
        step = Step.find_or_create_by(step_attribute)
        self.steps << step
      end
    end
  end 

end
