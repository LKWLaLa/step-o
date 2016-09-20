class StepSerializer < ActiveModel::Serializer
  attributes :id, :name, :notes, :level_of_mastery, :user_id
  has_many :styles
  has_many :timemarkers, serializer: StepTimemarkersSerializer

end
