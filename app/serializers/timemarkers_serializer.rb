class TimemarkersSerializer < ActiveModel::Serializer
  attributes :id, :marker, :video_id, :step_id
end
