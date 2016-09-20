class StepTimemarkersSerializer < ActiveModel::Serializer
  attributes :marker, :step_id, :video_id, :video 
end
