class StepTimemarkersSerializer < ActiveModel::Serializer
  attributes :marker, :video
  has_one :video, serializer: TimemarkerVideoSerializer
end
