class Log < ActiveRecord::Base
  belongs_to :graph
  attr_accessible :graph_id, :happened_at, :number

  private
  def self.average(logs)
    values = logs.map{|log| log.number }
    values.sum.to_f / values.size
  end
end
