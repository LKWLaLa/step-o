class Step < ActiveRecord::Base
  belongs_to :user
  has_many :timemarkers
  has_many :videos, through: :timemarkers
  has_many :step_styles
  has_many :styles, through: :step_styles

  validates :name, presence: true

  def videos_attributes=(video_attributes)
    video_attributes.values.each do |video_attribute|
      if video_attribute[:url].present? && video_attribute[:title].present?
        video = Video.find_or_create_by(video_attribute)
        self.timemarkers.build(:video => video) if !self.videos.include?(video)
      end
    end
  end 
  
end
