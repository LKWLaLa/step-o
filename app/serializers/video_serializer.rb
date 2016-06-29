class VideoSerializer < ActiveModel::Serializer
  attributes :id, :notes, :title, :url, :year, :user_id
  has_many :timemarkers, serializer: VideoTimemarkersSerializer

end
