class Video < ActiveRecord::Base

  belongs_to :user
  has_many :timemarkers, dependent: :destroy
  has_many :steps, through: :timemarkers
  has_many :styles, through: :steps

  validates :url, presence: true
  validates :title, presence: true

  accepts_nested_attributes_for :timemarkers, allow_destroy: true,
  reject_if: proc { |attribute| attribute['marker'].blank? && attribute['step_attributes']['name'].blank?}

  def self.filter_by_style(style_id)
      joins(:timemarkers).where(timemarkers: {step_id: Step.filter_by_style(style_id)}).uniq
  end

  def self.search(search)
    where("title LIKE ? OR notes LIKE ?", "%#{search}%", "%#{search}%") 
  end

end
