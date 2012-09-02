class Log < ActiveRecord::Base
  belongs_to :graph
  attr_accessible :happend_at, :number
end
