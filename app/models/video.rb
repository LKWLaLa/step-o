class Video < ActiveRecord::Base

  belongs_to :user
  has_many :timemarkers
  has_many :steps, through: :timemarkers
  has_many :styles, through: :steps

  validates :url, presence: true
  validates :title, presence: true

  accepts_nested_attributes_for :timemarkers


end
