class Video < ActiveRecord::Base

  belongs_to :user
  has_many :timemarkers
  has_many :steps, through: :timemarkers
  has_many :styles, through: :steps

  validates :url, presence: true
  validates :title, presence: true

  def step_attributes=(step_attributes)
    step_attributes.values.each do |step_attribute|
      if step_attribute[:name].present? 
        step = Step.find_or_create_by(step_attribute)
        self.steps << step
      end
    end
  end 

end
