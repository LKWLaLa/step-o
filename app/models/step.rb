class Step < ActiveRecord::Base
  belongs_to :user
  has_many :timemarkers, dependent: :destroy
  has_many :videos, through: :timemarkers
  has_many :step_styles
  has_many :styles, through: :step_styles

  validates :name, presence: true

   accepts_nested_attributes_for :timemarkers, allow_destroy: true, 
   reject_if: proc { |attribute| attribute['marker'].blank? && attribute['video_attributes']['url'].blank?}

   def styles_attributes=(new_styles_hash)
    new_styles_hash.values.each do |attributes|
      if attributes[:name].present?
        style = Style.find_or_create_by(name: attributes[:name], user_id: attributes[:user_id])
        self.step_styles.build(:style => style)
      end
    end
   end
   

   def self.filter_by_style(style_id)
      joins(:step_styles).where(step_styles: {style_id: style_id})
   end

  def self.search(search)
    where("name LIKE ? OR notes LIKE ?", "%#{search}%", "%#{search}%") 
  end

  
end
