class StepSerializer < ActiveModel::Serializer
  attributes :id, :name, :notes, :level_of_mastery, :user_id
end
