class Timemarker < ActiveRecord::Base
  belongs_to :video
  belongs_to :step

end
