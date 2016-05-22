class Step < ActiveRecord::Base
  belongs_to :user
  has_many :timemarkers
  has_many :videos, through: :timemarkers
  has_many :step_styles
  has_many :styles, through: :step_styles

  validates :name, presence: true

  accepts_nested_attributes_for :timemarkers, reject_if: proc { |attribute| attribute['marker'].blank? }

  
end
