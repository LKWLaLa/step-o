class Step < ActiveRecord::Base
  belongs_to :user
  has_many :timemarkers
  has_many :videos, through: :timemarkers
  has_many :step_styles
  has_many :styles, through: :step_styles

  validates :name, presence: true
  
end
