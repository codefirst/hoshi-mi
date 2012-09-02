class Log < ActiveRecord::Base
  belongs_to :graph_id
  attr_accessible :happend_at, :number
end
