class Step < ActiveRecord::Base
  belongs_to :user
  has_many :timemarkers, dependent: :destroy
  has_many :videos, through: :timemarkers
  has_many :step_styles
  has_many :styles, through: :step_styles

  validates :name, presence: true

   accepts_nested_attributes_for :timemarkers, allow_destroy: true, 
   reject_if: proc { |attribute| attribute['marker'].blank? && attribute['video_attributes']['url'].blank?}


   def self.filter_by_style(style_id)
      joins(:step_styles).where(step_styles: {style_id: style_id})
   end
  
end
