class Step < ActiveRecord::Base
  belongs_to :user
  has_many :timemarkers, inverse_of: :step 
  has_many :videos, through: :timemarkers
  has_many :step_styles
  has_many :styles, through: :step_styles

  validates :name, presence: true

  def videos_attributes=(videos_attributes)
    videos_attributes.values.each do |video_attribute|
      if video_attribute[:url].present? && video_attribute[:title].present?
        video = Video.find_or_create_by(video_attribute)
        self.videos << video
      end
    end
  end 
  
end
