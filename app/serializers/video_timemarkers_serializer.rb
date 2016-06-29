class VideoTimemarkersSerializer < ActiveModel::Serializer
   attributes :id, :step_id, :video_id, :marker, :step
   has_one :step, serializer: TimemarkerStepSerializer
end
