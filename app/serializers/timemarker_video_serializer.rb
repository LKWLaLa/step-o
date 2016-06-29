class TimemarkerVideoSerializer < ActiveModel::Serializer
  attributes :id, :notes, :title, :url, :year, :user_id
end
