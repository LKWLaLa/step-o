class VideoTimemarkersSerializer < ActiveModel::Serializer
   attributes :marker, :step_id, :video_id, :step
end
