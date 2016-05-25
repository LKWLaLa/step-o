class Video < ActiveRecord::Base

  belongs_to :user
  has_many :timemarkers, dependent: :destroy
  has_many :steps, through: :timemarkers
  has_many :styles, through: :steps

  validates :url, presence: true
  validates :title, presence: true

  accepts_nested_attributes_for :timemarkers, allow_destroy: true,
  reject_if: proc { |attribute| attribute['marker'].blank? && attribute['step_attributes']['name'].blank?}


end
