class Log < ActiveRecord::Base
  belongs_to :graph
  attr_accessible :graph_id, :happened_at, :number
end
